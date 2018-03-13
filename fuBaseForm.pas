unit fuBaseForm;

interface

uses Messages, Classes, Controls, Forms, TypInfo,ActnList;

type
  TDebugMode = (dmNotAssigned, dmIsOn, dmIsOff);

type
  TfmBaseForm = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FCaption: TCaption;
    FDebugMode: TDebugMode;
    FOwnIndex: string;
    FExtendedNotes: boolean;
    FSaveClientInfo: string;
    FInfoACLMode: integer;
    procedure SetCaption(const Value: TCaption);
    procedure SetOwnIndex(const Value: string);
    procedure SetFormDebugMode(obj: TfmBaseForm; const mode: TDebugMode);
    procedure SetDebugMode(const mode: TDebugMode);
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
    procedure ShowSupportInfo;
  protected
    procedure Loaded; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    property Caption: TCaption read FCaption write SetCaption;
    property OwnIndex: string read FOwnIndex write SetOwnIndex;
    //property ExtendedNotes: boolean read FExtendedNotes write FExtendedNotes;
    property DebugMode: TDebugMode read FDebugMode write SetDebugMode;
    function ShowModalACL(acl: TStringList = nil; index: string = ''): Integer; //override;
    function ShowModal: Integer; override;
    procedure ApplyACL(acl: TStringList; index: string = '');
  published
    property ExtendedNotesACL: boolean read FExtendedNotes write FExtendedNotes default False;
  end;

TMalFormClass = class of TfmBaseForm;

implementation

{$R *.dfm}

uses Windows, Dialogs, SysUtils, uAppInfo, uCommonTypes, muSDIBrowse,
     MalOraDataSet, MalDBGrid, MalOraNonVisual, ComCtrls, Menus, iuNSI;

const CRLF   = #10#13;
const EXT_NOTE = ':E=X=T=N=O=T=E:';

var
  UM_SUPPORT_INFO: Cardinal;

{ TfmBaseForm }

//=================================================================================================
procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings);
var PStart, PEnd: PChar;
    flag: boolean;
begin
    flag := false;
    PEnd:=PChar(Str);
    ListOfStrings.Clear;
    while PEnd^ <> #0 do  begin
        PStart:=PEnd;
        while not (PEnd^ in [#0,Delimiter]) do inc(PEnd);
        ListOfStrings.Add(Copy(PStart,0,PEnd-PStart));
        flag := true;
        if PEnd^=Delimiter then begin
           Inc(PEnd); flag := false;
        end;
    end;
    if not flag then ListOfStrings.Add('');
end;

//=================================================================================================
function WordCount(const S: string; const WordDelims: char): Integer;
var
  arr: TStringList;
begin
  arr := TStringList.Create;
  Split(WordDelims, S, arr);
  result := arr.Count;
  arr.Free;
end;

//=================================================================================================
function ExtractWord(N: Integer; const S: string; const WordDelims: char): string;
var
  arr: TStringList;
begin
  result := '';
  arr := TStringList.Create;
  Split(WordDelims, S, arr);
  if (N <= arr.Count) and (N > 0) then result := arr.Strings[N-1];
  arr.Free;
end;

//=================================================================================================
function getModuleName: string;
var
  lv_file_name: array[0..MAX_PATH + 255] of Char;
begin
  GetModuleFileName(HInstance, lv_file_name, SizeOf(lv_file_name));
  result := ExtractFileName(String(lv_file_name));
end;

//=================================================================================================
function TfmBaseForm.ShowModal: Integer;
var
    interfaceToken: string;
    clearInterfaceToken: boolean;
begin

  ExtendedNotesACL := false;
  interfaceToken := '';
  clearInterfaceToken := false;

  if Assigned (iuNSI.getACL(nil)) then
    if (pos(EXT_NOTE, iuNSI.getACL(nil).Text) > 0)  then begin
        clearInterfaceToken := true;
        // проверка режима ExtendedNotes пользователя на уровне модуля
        if (pos(ansiUpperCase(getModuleName) + EXT_NOTE, iuNSI.getACL(nil).Text) > 0) then
            ExtendedNotesACL := true;
    end;

  ApplyACL(iuNSI.getACL(nil), OwnIndex);  // здесь ExtendedNotesACL м.б. изменен!

  if ExtendedNotesACL then
     interfaceToken := 'ACL:' + ExtractFileName(Application.ExeName) + ':' +
              getModuleName + ':' + Name  + ':' + IntToStr(Tag);

  if ExtendedNotesACL or clearInterfaceToken then begin
     FSaveClientInfo := iuNSI.setClientInfoACL(interfaceToken);
     // метка используется прикладным софтом, менять нельзя
     if FSaveClientInfo = '' then ExtendedNotesACL := false;
   end;

  if Tag = 2000 then begin
     ShowMessage('Модуль: ' + getModuleName + CRLF +
                 'Форма: ' + Name + CRLF +
                 'Отсутствуют права на открытие данной формы.');
     result := mrNone;
     Close;
     exit;
  end;
  result := inherited ShowModal;
end;

//=================================================================================================
function TfmBaseForm.ShowModalACL(acl: TStringList = nil; index: string = ''): Integer;
begin
  if Assigned(acl) then ApplyACL(acl, index);
  OwnIndex := index;
  result := ShowModal;
end;

//=================================================================================================
procedure TfmBaseForm.ApplyACL(ACL: TStringList; index: string);

  //=============================================
  procedure setTAction(obj: TAction; acl: string; val: boolean);
  begin
   if pos('(V)', acl) > 0 then obj.Visible := val;
   if pos('(E)', acl) > 0 then obj.Enabled := val;
  end;

  //=============================================
  procedure setTControl(obj: TControl; acl: string; val: boolean);
  begin
   if pos('(V)', acl) > 0 then obj.Visible := val;
   if pos('(E)', acl) > 0 then obj.Enabled := val;
  end;

  //=============================================
  procedure setTfmBaseForm(obj: TfmBaseForm; acl: string; val: boolean);
    //=============================================
    procedure setEnabled(obj: TComponent; mode: boolean);
    var i: integer;
    begin
       for i := 0 to obj.ComponentCount - 1 do begin
          if not (obj.Components[i] is TComponent) then continue;

          if (obj.Components[i] as TComponent).ComponentCount > 0 then
             setEnabled((obj.Components[i] as TComponent), val);

          if not (obj.Components[i] is TWinControl) then continue;

          (obj.Components[i] as TWinControl).Enabled := val;
       end;
    end;
  begin
   if pos('(V)', acl) > 0 then
      if val then obj.Tag := 0
      else obj.Tag := 2000;
   if pos('(E)', acl) > 0 then
      setEnabled((self as TComponent), val);

    // установка режима расширенного сообщения через acl
   if pos('(I)', acl) > 0 then ExtendedNotesACL := val;

  end;

  //=============================================
  procedure setTfrSDIBrowse(obj: TfrSDIBrowse; acl: string; val: boolean);

    //=============================================
    procedure setBrowseOption(obj: TfrSDIBrowse; acl: string; val: boolean; 
         optionSmb: string; optionVal: TBrowseOptionSet);
    begin
       if pos(optionSmb, acl) > 0 then begin
         if val then begin  // добавить в набор
            obj.BrowseOptionSet := obj.BrowseOptionSet + optionVal;
         end else begin     // убрать из набора
            obj.BrowseOptionSet := obj.BrowseOptionSet - optionVal;
         end;
       end;
    end;

  begin
    setBrowseOption(obj,acl,val,'(S)',[boSelect]);
    setBrowseOption(obj,acl,val,'(U)',[boEdit]);
    setBrowseOption(obj,acl,val,'(I)',[boInsert]);
    setBrowseOption(obj,acl,val,'(D)',[boDelete]);
  end;

  //=============================================
  procedure setTMalDBGrid(obj: TMalDBGrid; name: string; acl: string; val: boolean);
  var i: integer;
      flag: boolean;
  begin
    if pos('(V)', acl) <= 0 then exit;

    flag := false;
    for i := 0 to obj.Columns.Count - 1 do begin
       if ansiUpperCase(obj.Columns[i].Title.Caption) <> name then continue;
       obj.Columns[i].Visible := val;
       flag := true;
       break;
    end;
    try
      if not flag then obj.ColumnByFieldName[name].visible := val;
    finally
    //
    end;
  end;

  //=============================================
  procedure setTPageControl(obj: TPageControl; name: string; acl: string; val: boolean);
  var i: integer;
  begin
    for i := 0 to obj.PageCount - 1 do begin
       if (ansiUpperCase(obj.Pages[i].Caption) <> name) and (ansiUpperCase(obj.Pages[i].Name) <> name) then continue;

       if pos('(V)', acl) > 0 then obj.Pages[i].TabVisible := val;
       if pos('(E)', acl) > 0 then obj.Pages[i].Enabled := val;

       break;
    end;
  end;

    //=============================================
    procedure setTMenuItem(obj: TMenuItem; name: string; acl: string; val: boolean);
    var i: integer;
    begin
      for i := 0 to obj.Count - 1 do begin
         if (ansiUpperCase(obj.Items[i].name) <> name) and (ansiUpperCase(obj.Items[i].Caption) <> name) then begin
            if obj.Items[i].Count > 0 then
               setTMenuItem(obj.Items[i], name, acl, val);
            continue;
         end;
         if pos('(V)', acl) > 0 then obj.Items[i].Visible := val;
         if pos('(E)', acl) > 0 then obj.Items[i].Enabled := val;
         break;
      end;
    end;

  //=============================================
  procedure setTMainMenu(obj: TMainMenu; name: string; acl: string; val: boolean);
  var i: integer;
  begin
    for i := 0 to obj.Items.Count - 1 do begin
       if (ansiUpperCase(obj.Items[i].name) <> name) and (ansiUpperCase(obj.Items[i].Caption) <> name) then begin
          if obj.Items[i].Count > 0 then
             setTMenuItem(obj.Items[i], name, acl, val);
          continue;
       end;
       if pos('(V)', acl) > 0 then obj.Items[i].Visible := val;
       if pos('(E)', acl) > 0 then obj.Items[i].Enabled := val;
       break;
    end;
  end;

  //=============================================
  procedure setTPopupMenu(obj: TPopupMenu; name: string; acl: string; val: boolean);
  var i: integer;
  begin
    for i := 0 to obj.Items.Count - 1 do begin
       if (ansiUpperCase(obj.Items[i].name) <> name) and (ansiUpperCase(obj.Items[i].Caption) <> name) then begin
          if obj.Items[i].Count > 0 then
             setTMenuItem(obj.Items[i], name, acl, val);
          continue;
       end;
       if pos('(V)', acl) > 0 then obj.Items[i].Visible := val;
       if pos('(E)', acl) > 0 then obj.Items[i].Enabled := val;
       break;
    end;
  end;

  //=============================================
  function getComponent(obj: TComponent; var idx: array of integer; componentName: string): boolean;
  var i, level, max_level: integer;
  var name: string;
  var comp: TComponent;
  begin
    result := false;

    if ansiUpperCase(obj.Name) = componentName then begin
       result := true;
       exit;
    end;

    level := 0;
    for i := 0 to length(idx)-1 do begin
       inc(level);
       if idx[i] = -1 then break;
    end;

    if level >= length(idx) then exit; // такой глубины не бывает

    // имя компонента на текущем уровне
    name := ExtractWord(level,componentName,'.');
    max_level := WordCount(componentName,'.');

    for i := 0 to obj.ComponentCount - 1 do begin
       if not (obj.Components[i] is TComponent) then continue;
       comp := (obj.Components[i] as TComponent);
       if ansiUpperCase(comp.Name) <> name then continue;

       idx[level-1] := i;
       idx[level] := -1;
       if level = max_level then
          result := true
       else
          result := getComponent(comp, idx, componentName);
       break;
    end;
  end;

var
  module: String;
  i, j: integer;
  componentName, fieldName: string;
  comp: TComponent;
  idx: array[0..99] of integer;
  slACL: TStringList;
const
  IDX_TAG     = 1;
  IDX_ACL_ON  = 2;
  IDX_ACL_OFF = 3;
begin
  if not Assigned(ACL) then exit;

  slACL := TStringList.Create;

  module := ansiUpperCase(getModuleName + ':' + Name + ':');
  // 1      2     3        4
  // module:form:component:auxi#tag#rigth_on#rigth_off
  //MALNSI.DLL:SERVICEEDIT:MALPAGECONTROL1:TABSHEET1#633#(V)#(E)
  //1          2           3               4

  for i := 0 to ACL.Count - 1 do begin
     if pos(module, ACL.Strings[i]) <> 1 then continue;
     componentName := ExtractWord(3, ACL.Strings[i], ':');

     // с модулем и формой не ошиблись, ищем компонент:
     idx[0] := -1;
     if not getComponent(self, idx, componentName) then continue;

     Split('#', ACL.Strings[i], slACL);

     if slACL.Count <> 4 then continue; // кривая структура

     if pos(','+ index +',',','+ slACL.Strings[IDX_TAG]+',') <= 0 then continue;

     // (+)  - ТОЛЬКО расширение прав
     if pos(',(+),',','+ slACL.Strings[IDX_TAG]+',') > 0 then
        slACL.Strings[IDX_ACL_OFF] := '';

     // (-)  - ТОЛЬКО ограничение прав
     if pos(',(-),',','+ slACL.Strings[IDX_TAG]+',') > 0 then
        slACL.Strings[IDX_ACL_ON] := '';

     if (slACL.Strings[IDX_ACL_ON] = '') and (slACL.Strings[IDX_ACL_OFF] = '') then continue;

     // нашли
     if idx[0] = -1 then begin
       comp := self;
     end else begin
       comp := self;
       for j := 0 to length(idx) do begin
          if idx[j] = -1 then break;
          comp := comp.Components[idx[j]];
       end;
     end;

     if (comp is TfrSDIBrowse) then begin
         setTfrSDIBrowse((comp as TfrSDIBrowse), slACL.Strings[IDX_ACL_ON],  true);
         setTfrSDIBrowse((comp as TfrSDIBrowse), slACL.Strings[IDX_ACL_OFF], false);

         setTControl((comp as TControl), slACL.Strings[IDX_ACL_ON], true);
         setTControl((comp as TControl), slACL.Strings[IDX_ACL_OFF], false);
         continue;
     end;

     if (comp is TMalDBGrid) then begin
         fieldName := ExtractWord(4,slACL.Strings[0],':');
         setTMalDBGrid((comp as TMalDBGrid), fieldName, slACL.Strings[IDX_ACL_ON], true);
         setTMalDBGrid((comp as TMalDBGrid), fieldName, slACL.Strings[IDX_ACL_OFF], false);
         continue;
     end;

     if (comp is TPageControl) then begin
         fieldName := ExtractWord(4,slACL.Strings[0],':');
         setTPageControl((comp as TPageControl), fieldName, slACL.Strings[IDX_ACL_ON], true);
         setTPageControl((comp as TPageControl), fieldName, slACL.Strings[IDX_ACL_OFF], false);
         continue;
     end;

     if (comp is TMainMenu) then begin
         fieldName := ExtractWord(4,slACL.Strings[0],':');
         setTMainMenu((comp as TMainMenu), fieldName, slACL.Strings[IDX_ACL_ON], true);
         setTMainMenu((comp as TMainMenu), fieldName, slACL.Strings[IDX_ACL_OFF], false);
         continue;
     end;

     if (comp is TPopupMenu) then begin
         fieldName := ExtractWord(4,slACL.Strings[0],':');
         setTPopupMenu((comp as TPopupMenu), fieldName, slACL.Strings[IDX_ACL_ON], true);
         setTPopupMenu((comp as TPopupMenu), fieldName, slACL.Strings[IDX_ACL_OFF], false);
         continue;
     end;

     if (comp is TfmBaseForm) then begin
         setTfmBaseForm((comp as TfmBaseForm), slACL.Strings[IDX_ACL_ON],  true);
         setTfmBaseForm((comp as TfmBaseForm), slACL.Strings[IDX_ACL_OFF], false);
         continue;
     end;

     if (comp is TControl) then begin
        setTControl((comp as TControl), slACL.Strings[IDX_ACL_ON], true);
        setTControl((comp as TControl), slACL.Strings[IDX_ACL_OFF], false);
        continue;
     end;

     if (comp is TAction) then begin
        setTAction((comp as TAction), slACL.Strings[IDX_ACL_ON], true);
        setTAction((comp as TAction), slACL.Strings[IDX_ACL_OFF], false);
        continue;
     end;
  end;
  slACL.Free;
end;

//=================================================================================================
procedure applyDebugMode(obj: TComponent; mode: boolean);
var i: integer;
begin
    for i := 0 to obj.ComponentCount - 1 do begin
       if not (obj.Components[i] is TComponent) then continue;

       if (obj.Components[i] is TMalOraQuery) then
          (obj.Components[i] as TMalOraQuery).debug := mode
       else if (obj.Components[i] is TMalOraSql) then
          (obj.Components[i] as TMalOraSql).debug := mode
       else if (obj.Components[i] as TComponent).ComponentCount > 0 then
          applyDebugMode((obj.Components[i] as TComponent), mode);
    end;
end;

//=================================================================================================
procedure TfmBaseForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    lv_DebugMode: TDebugMode;
    filter: string;
    slACL: TStringList;
    filterACL: string;
    i: integer;
begin

  if (ssAlt in Shift) and (ssCtrl in Shift) and (Key = 68) then begin  // Ctrl+Alt+D
     lv_DebugMode := self.DebugMode;

     if (lv_DebugMode = dmIsOff) or (lv_DebugMode = dmNotAssigned) then
        lv_DebugMode := dmIsOn
     else
        lv_DebugMode := dmIsOff;

     if lv_DebugMode = dmIsOn then
        ShowMessage('Debug mode: ON')
     else
        ShowMessage('Debug mode: OFF');

     SetDebugMode(lv_DebugMode);
  end;

  if (ssAlt in Shift) and (ssCtrl in Shift) and (Key = 65) then begin// Ctrl+Alt+A  (все права)
     if not Assigned (iuNSI.getACL(nil)) then begin
       ShowMessage('ACL: not assigned' );
       exit;
     end;
     filter := '';
     case FInfoACLMode of
       0: begin
            filterACL := 'ACL, права на текущем модуле и форме:';
            filter := ansiUpperCase(getModuleName + ':' + Name + ':');
          end;
       1: begin
            filterACL := 'ACL, права на текущем модуле:';
            filter := ansiUpperCase(getModuleName + ':');
          end;
       2: begin
            filterACL := 'ACL, все права:' + CRLF + iuNSI.getACL(nil).Text;
          end;
     end;
     if filter <> '' then begin
         slACL := iuNSI.getACL(nil);
         for i := 0 to slACL.Count - 1 do
             if pos(filter, slACL.Strings[i]) = 1 then
                filterACL := filterACL + CRLF + slACL.Strings[i];
     end;
     FInfoACLMode := (FInfoACLMode+1) mod 3;
     ShowMessage(filterACL);
  end;
  inherited;
end;

//=================================================================================================
constructor TfmBaseForm.Create(aOwner: TComponent);
var SysMenu: THandle;
    hWnd, i: integer;
    lv_DebugMode: TDebugMode;
begin
  inherited Create(aOwner);
  SysMenu:= GetSystemMenu(Handle, False);
  AppendMenu(SysMenu, MF_SEPARATOR, 0, '');
  AppendMenu(SysMenu, MF_STRING, UM_SUPPORT_INFO, '&Support Info');

  OwnIndex := '';             // по умолчанию индекс объекта не установлен
  ExtendedNotesACL := false;  // по умолчанию переопределение ClientInfo выключено
  FSaveClientInfo := '';      // по умолчанию ClientInfo пустое
  FInfoACLMode := 0;          // режим отображения информации ACL
  // режим отладки по умолчанию - не установлен
  lv_DebugMode := dmNotAssigned;

  hWnd := GetWindowLong(self.Handle, GWL_HWNDPARENT);

  // проверяем режим на формах текущего приложения
  for i := 0 to Screen.FormCount - 1 do begin
      if Screen.Forms[i] is TfmBaseForm then
        if hWnd = GetWindowLong((Screen.Forms[i] as TComponent).Handle, GWL_HWNDPARENT) then
           if (Screen.Forms[i] as TfmBaseForm).DebugMode <> dmNotAssigned then begin
              lv_DebugMode := (Screen.Forms[i] as TfmBaseForm).DebugMode;
              break;
           end;
  end;

  SetDebugMode(lv_DebugMode);
end;

//=================================================================================================
destructor TfmBaseForm.Destroy;
begin
   // пустая строка только в случае использования метки сессии прикладным софтом
   if FSaveClientInfo <> '' then
      iuNSI.setClientInfoACL(FSaveClientInfo);
   inherited Destroy;
end;

//=================================================================================================
procedure TfmBaseForm.Loaded;
begin
  inherited Loaded;

  if not (csDesigning in ComponentState) then begin
    Self.Caption:= TForm(Self).Caption;
  end;
end;

//=================================================================================================
procedure TfmBaseForm.SetFormDebugMode(obj: TfmBaseForm; const mode: TDebugMode);
begin
   if obj.DebugMode = mode then exit;

   obj.FDebugMode := mode;
   applyDebugMode((obj as TComponent), mode = dmIsOn);
end;

//=================================================================================================
procedure TfmBaseForm.SetDebugMode(const mode: TDebugMode);
var i, hWnd: integer;
begin

  if mode = dmNotAssigned then exit;

  hWnd := GetWindowLong(self.Handle, GWL_HWNDPARENT);
  // устанавливаем выбранный режим на всех открытых формах и соотв. компонентах текущего приложения
  for i := 0 to Screen.FormCount-1 do begin
      if Screen.Forms[i] is TfmBaseForm then
         if hWnd = GetWindowLong((Screen.Forms[i] as TComponent).Handle, GWL_HWNDPARENT) then begin
           (Screen.Forms[i] as TfmBaseForm).SetFormDebugMode((Screen.Forms[i] as TfmBaseForm), mode);
         end;
  end;
end;

//=================================================================================================
procedure TfmBaseForm.SetOwnIndex(const Value: string);
begin
  FOwnIndex := Value;
end;

//=================================================================================================
procedure TfmBaseForm.SetCaption(const Value: TCaption);
begin
  FCaption := Value;
  if Application.Tag <> 0 then begin
    TForm(Self).Caption:= TApplicationInfo(Application.Tag).AddCaption + Self.FCaption;
  end else begin
    TForm(Self).Caption:= Self.FCaption;
  end;
end;

//=================================================================================================
procedure TfmBaseForm.ShowSupportInfo;
    //=============================================
    function getComponents(obj: TComponent; var list: string; nested: integer): string;
    var i: integer;
    begin
       for i := 0 to obj.ComponentCount - 1 do begin
          if not (obj.Components[i] is TComponent) then continue;

          list := list + CRLF + StringOfChar(' ', nested*4) +
                  'name: ' + (obj.Components[i] as TComponent).Name +
                  ', className: ' + (obj.Components[i] as TComponent).ClassName;

          if GetPropInfo(obj.Components[i].ClassInfo, 'Caption') <> nil then
             list := list + ', caption: ' + GetStrProp(obj.Components[i],'Caption');

          if (obj.Components[i] as TComponent).ComponentCount > 0 then
             getComponents((obj.Components[i] as TComponent), list, nested+1);
       end;
       result := list;
    end;

var
  lv_Message: String;
  lv_list: string;
begin
  lv_Message:= 'Модуль: ' + getModuleName + #10 +
               'Тип формы: ' + Self.ClassName + #10 +
               'Название экземпляра: ' + Self.Name;

  lv_list := '';
  if FDebugMode = dmIsOn then
     lv_Message := lv_Message + CRLF + getComponents((self as TComponent), lv_list, 0);

  ShowMessage(lv_Message);
end;

//=================================================================================================
procedure TfmBaseForm.WMSysCommand(var Message: TWMSysCommand);
begin
       if Cardinal(Message.CmdType) = UM_SUPPORT_INFO then ShowSupportInfo()
  else if Cardinal(Message.CmdType) = SC_MINIMIZE then Application.Minimize()
  else inherited;
end;


initialization
  UM_SUPPORT_INFO:= RegisterWindowMessage(PChar('UM_SUPPORT_INFO'));
end.

