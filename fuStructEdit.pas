unit fuStructEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FUBASEFORM, ExtCtrls, MalAdditionalExtCtrls, MalStdCtrls
  ,ActnList, BrowseParams,
  muSDIBrowse, DB, MemDS, DBAccess, Ora, MalOraDataSet, MalOraNonVisual,
  StdCtrls, DBGridEh, Grids, DBCtrls, MalDBStdControls, uGridStateMgr2,
  ComCtrls, VirtualTable, MalComCtrls, Menus
  ,MalDBGrid
  ,uCommonTypes, ImgList, MalControls
  ;

type
   TSTCardMode = (cmSTView,cmSTEdit,cmSTEditVector);

type
  TStructEdit = class(TfmBaseForm)
    pBack: TMalPanel;
    pLeft: TMalPanel;
    msSplitter: TMalSplitter;
    pRight: TMalPanel;
    tvStruct: TMalTreeView;
    frSDIBrowseHead: TfrSDIBrowse;
    quService: TMalOraQuery;
    pmStruct: TPopupMenu;
    AddElement: TMenuItem;
    ViewElement: TMenuItem;
    ChangeElement: TMenuItem;
    quStruct: TMalOraQuery;
    sqlAddNewElement: TMalOraSqL;
    N1: TMenuItem;
    ShowClosed: TMenuItem;
    pRightTop: TMalPanel;
    MalSplitter1: TMalSplitter;
    pRightCenter: TMalPanel;
    quServicePreset: TMalOraQuery;
    frSDIBrowsePreset: TfrSDIBrowse;
    CreatePreset: TMenuItem;
    N2: TMenuItem;
    quStructPreset: TMalOraQuery;
    sqlRestoreStruct: TMalOraSqL;
    sqlReplaceParent: TMalOraSqL;
    pRightDown: TMalPanel;
    MalSplitter2: TMalSplitter;
    frSDIBrowsePresetCopy: TfrSDIBrowse;
    quServicePresetCopy: TMalOraQuery;
    quStructPresetCopy: TMalOraQuery;
    sqlCopyPreset: TMalOraSqL;
    sqlCheckElement: TMalOraSqL;
    sqlUpdatePresetElement: TMalOraSqL;
    DoubleMarked: TMenuItem;
    CreateLocalPreset: TMenuItem;
    tvStructImages: TMalImageList;
    TurnOnOff: TMenuItem;
    sqlTurnOnOff: TMalOraSqL;
    sqlCheckElement_ST: TMalOraSqL;
    sqlGetDefaultVector: TMalOraSqL;
    procedure pmStructPopup(Sender: TObject);
    procedure frSDIBrowsedsBrowseDataChange(Sender: TObject;
      Field: TField);
    procedure ChangeElementClick(Sender: TObject);
    procedure AddElementClick(Sender: TObject);
    procedure ViewElementClick(Sender: TObject);
    procedure ShowClosedClick(Sender: TObject);
    procedure CreatePresetClick(Sender: TObject);
    procedure frSDIBrowsePresetdsBrowseDataChange(Sender: TObject;
      Field: TField);
    procedure FormShow(Sender: TObject);
    procedure frSDIBrowsePresetEnter(Sender: TObject);
    procedure frSDIBrowseHeaddgrBrowseEnter(Sender: TObject);
    procedure frSDIBrowsePresetCopydsBrowseDataChange(Sender: TObject;
      Field: TField);
    procedure frSDIBrowsePresetCopyEnter(Sender: TObject);
    procedure frSDIBrowsePresetCopyacEditExecute(Sender: TObject);
    procedure frSDIBrowsePresetCopyacViewCardExecute(Sender: TObject);
    procedure frSDIBrowsePresetacInsertExecute(Sender: TObject);
    procedure frSDIBrowsePresetdgrBrowseDragDrop(Sender, Source: TObject;
      X, Y: Integer);
    procedure frSDIBrowsePresetdgrBrowseDragOver(Sender, Source: TObject;
      X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tvStructEnter(Sender: TObject);
    procedure DoubleMarkedClick(Sender: TObject);
    procedure CreateLocalPresetClick(Sender: TObject);
    procedure frSDIBrowsePresetacSelectExecute(Sender: TObject);
    procedure frSDIBrowsePresetCopyacSelectExecute(Sender: TObject);
    procedure tvStructChange(Sender: TObject; Node: TTreeNode);
    procedure TurnOnOffClick(Sender: TObject);
    procedure frSDIBrowsePresetCopydgrBrowseDragDrop(Sender,
      Source: TObject; X, Y: Integer);
    procedure frSDIBrowsePresetCopydgrBrowseDragOver(Sender,
      Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean);
  private
    { Private declarations }
    aParams: TBrowseRefParams;
    aShowClosed: integer;
    aSection: integer;
    aElementID: integer;
    aSelectedID: integer;
    locVector: string;
    aSTCardMode: TSTCardMode;
    procedure FillStruct(query: TMalOraQuery; parent: TTreeNode=nil);
    function getFilter(groupID: integer): integer;
    function getHeadID(headID: integer; groupID: integer): integer;
  public
    { Public declarations }
  end;

var
  StructEdit: TStructEdit;

//procedure StructEditor(Params: TBrowseRefParams);
function StructEditor(Params: TBrowseRefParams; aServiceID: integer; var aVector: string; aCardMode: TCardMode = cmView): integer;

implementation

uses iuNsi, uVarUtils, uDBUtils
  ,fuServiceEdit
  ,uLogicUtils
  ,umessages
  ,OraObjects
  ;

{$R *.dfm}

const HEAD_STRUCT_GROUP_ID = 1513;
const LIST_STRUCT_ELEMENT_ID = 1514;

const HEAD_STRUCT_PRESET_GROUP_ID = 1517;
const LIST_STRUCT_PRESET_ELEMENT_ID = 1518;

const HEAD_STRUCT_PRESET_COPY_GROUP_ID = 1519;
const LIST_STRUCT_PRESET_COPY_ELEMENT_ID = 1520;

const ST_VECTOR_DESCRIPT_ID = 819;

procedure SelectItem(tv: TMalTreeView; idx: integer);
var i: integer;
begin
  try
    for i :=0 to tv.Items.Count-1 do begin
       if tv.Items.Item[i].SelectedIndex = idx then begin
          tv.Items.Item[i].Selected := true;
          exit;
       end;
    end;
  except
      tv.Items.Item[0].Selected := true;
  end;
end;

function TStructEdit.getFilter(groupID: integer): integer;
begin
  result := IIF(StrToInt(copy(IntToStr(aElementID),1,4)) = groupID,aElementID,0);
end;

function TStructEdit.getHeadID(headID: integer; groupID: integer): integer;
var filter_id: integer;
begin
  result := headID;
  filter_id := getFilter(groupID);
  if filter_id = 0 then // ���������� �� ����� ������� ���
     exit;
  // ������� id ��������� ������� (���� flag �� ����������� ������)
  if groupID = HEAD_STRUCT_PRESET_COPY_GROUP_ID then
    iunsi.getDataA(aParams,'Select flag from st_service s where s.service_id = :p_service_id',[filter_id])
  else
    iunsi.getDataA(aParams,'Select flag from service s where s.service_id = :p_service_id',[filter_id]);

  result := aParams.DataSet['flag'];
end;

function StructEditor(Params: TBrowseRefParams; aServiceID: integer; var aVector: string; aCardMode: TCardMode = cmView): integer;
var fm : TStructEdit;
begin

//aCardMode := cmEdit;
  try
    fm := TStructEdit.Create(Params.Owner);
    fm.aParams := Params;

    fm.locVector := aVector;

    with fm do begin
        aSection := 0;
        aElementID := 0;
        aSelectedID := 0;

        if aCardMode = cmView then
           aSTCardMode := cmSTView; // ������ ��������

        if aCardMode = cmEdit then begin
           aSTCardMode := cmSTEdit;  // �������������� ��� �����������
           if locVector <> '' then
              aSTCardMode := cmSTEditVector; // �������������� ������ ������� aVector, ��� �������������� ���������, ���������� cmSTView
        end;

        if aServiceID > 0 then begin
           aSection := StrToInt(copy(IntToStr(aServiceID),1,4));
           if (aSection = HEAD_STRUCT_GROUP_ID) or (aSection = HEAD_STRUCT_PRESET_GROUP_ID) or (aSection = HEAD_STRUCT_PRESET_COPY_GROUP_ID) then
              aElementID := aServiceID;
        end;

        aShowClosed := 0; // �� ���������� "��������" ��������
        uDBUtils.SetSession(fm,aParams.Session);

        with frSDIBrowseHead do begin
          quService.Close;
          CardClass := TServiceEdit;

          if aSTCardMode = cmSTEdit then
             BrowseOptionSet := [boSelect,boEdit,boInsert]
          else
             BrowseOptionSet := [boSelect];

          DataSet := quService;

          quService.ParamByName('p_service_type_id').AsInteger := HEAD_STRUCT_GROUP_ID;
          quService.ParamByName('p_filter_service_id').AsInteger := getFilter(HEAD_STRUCT_GROUP_ID);

          DataSet.Open;
          UpdateActionStatus;
        end;

        with frSDIBrowsePreset do begin
          quServicePreset.Close;
          CardClass := TServiceEdit;

          if aSTCardMode = cmSTEdit then
             BrowseOptionSet := [boSelect,boEdit,boInsert]
          else begin
            BrowseOptionSet := [boSelect];
            acCopyRecord.Enabled := false;
          end;

          DataSet := quServicePreset;

          quServicePreset.ParamByName('p_service_type_id').AsInteger := HEAD_STRUCT_PRESET_GROUP_ID;
          quServicePreset.ParamByName('p_head_service_id').AsInteger := getHeadID(VarToInt(frSDIBrowseHead.DataSet['service_id'],0), HEAD_STRUCT_PRESET_GROUP_ID);
          quServicePreset.ParamByName('p_filter_service_id').AsInteger := getFilter(HEAD_STRUCT_PRESET_GROUP_ID);

          if quServicePreset.ParamByName('p_filter_service_id').AsInteger > 0 then begin
             pRightTop.Visible := false;
             MalSplitter1.Visible := false;
          end;

          DataSet.Open;
          UpdateActionStatus;
        end;

        with frSDIBrowsePresetCopy do begin
          quServicePresetCopy.Close;
          CardClass := TServiceEdit;

          BrowseOptionSet := [boSelect];

          DataSet := quServicePresetCopy;
          quServicePresetCopy.ParamByName('p_service_type_id').AsInteger   := HEAD_STRUCT_PRESET_COPY_GROUP_ID;
          quServicePresetCopy.ParamByName('p_head_service_id').AsInteger   := getHeadID(VarToInt(frSDIBrowsePreset.DataSet['service_id'],0), HEAD_STRUCT_PRESET_COPY_GROUP_ID);
          quServicePresetCopy.ParamByName('p_filter_service_id').AsInteger := getFilter(HEAD_STRUCT_PRESET_COPY_GROUP_ID);

          if quServicePresetCopy.ParamByName('p_filter_service_id').AsInteger > 0 then begin
             pRightTop.Visible := false;
             pRightCenter.Visible := false;
             MalSplitter1.Visible := false;
             MalSplitter2.Visible := false;
          end;

          DataSet.Open;
          UpdateActionStatus;
        end;

        if aSTCardMode = cmSTView then begin // ����� ���������, ����� �������� ������ �� "�������" ������� ��������
           if pRightCenter.Visible or pRightDown.Visible then
              frSDIBrowseHead.BrowseOptionSet := frSDIBrowseHead.BrowseOptionSet - [boSelect];
           if pRightDown.Visible then
              frSDIBrowsePreset.BrowseOptionSet := frSDIBrowsePreset.BrowseOptionSet - [boSelect];
        end;

        aParams.SDIResult := mrCancel;

        //Params.SDIResult:=
        ShowModalACL(iuNSI.getACL(aParams.Session), intToStr(HEAD_STRUCT_GROUP_ID));

        Params.SDIResult := aParams.SDIResult;
        if Params.SDIResult = mrOk then
          if (aSTCardMode = cmSTEditVector) or (aSTCardMode = cmSTView) then
             aVector := fm.locVector;

        result := aSelectedID;
        Free;
    end;
  except
    on E:Exception do MessageDlg('������ ��� �������� ���� ������ ������!'#10#13+E.Message, mtError, [mbOk], 0)
  end;
end;

// �������� ��������� ���� ������� ���� ��� ������������ �������� ���������, �� ��������� ������ - ������,
// ����� ��������� ������������ ���������, ��� ������ ���� ���-�� ������� � ����
// ������� �� ����� ���� ������ "������� �_O_������� �����"
const cLOCAL_SET_FROM_GLOBAL = '������� ��������� �����';      // �������� ���������� ������ (����. st_service) �� ���� ������ ������ (����. service)
const cLOCAL_SET_FROM_LOCAL  = '������� �o������� �����';       // �������� ���������� ������ (����. st_service) �� ���� ���������� ������ (����. st_service)

procedure TStructEdit.pmStructPopup(Sender: TObject);
begin
  inherited;
  pmStruct.Items.Items[0].Enabled := false;

  if frSDIBrowseHead.DataSet.RecordCount > 0 then
     if VarToInt(frSDIBrowseHead.DataSet['service_id'],0) <> 0 then
         pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('�������� �������'))].Enabled := true;

  pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('��������'))].Enabled := not (tvStruct.Items.Count = 0);
  pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('��������'))].Enabled := not (tvStruct.Items.Count = 0);
  pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('������� ����� �����'))].Enabled := not (tvStruct.Items.Count = 0);

  pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find(cLOCAL_SET_FROM_LOCAL))].visible := false;
  pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find(cLOCAL_SET_FROM_GLOBAL))].visible := false;

  pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('��������'))].Visible := false;

  if aParams.Tag = frSDIBrowsePreset.Tag then begin
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('�������� �������'))].Enabled := false;
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('������� ����� �����'))].Enabled := false;
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find(cLOCAL_SET_FROM_GLOBAL))].visible := true;
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find(cLOCAL_SET_FROM_GLOBAL))].Enabled := true;
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find(cLOCAL_SET_FROM_LOCAL))].visible := false;
  end;

  if aParams.Tag = frSDIBrowsePresetCopy.Tag then begin
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('�������� �������'))].Enabled := false;
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('������� ����� �����'))].Enabled := false;
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find(cLOCAL_SET_FROM_LOCAL))].visible := true;
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find(cLOCAL_SET_FROM_LOCAL))].Enabled := true;
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find(cLOCAL_SET_FROM_GLOBAL))].visible := false;
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('��������'))].Visible := true;
  end;

  if aSTCardMode <> cmSTEdit then begin
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('�������� �������'))].Enabled := false;
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('������� ����� �����'))].Enabled := false;
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find(cLOCAL_SET_FROM_LOCAL))].Enabled := false;
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find(cLOCAL_SET_FROM_GLOBAL))].visible := false;
     pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('��������'))].Enabled := false;

     if aSTCardMode = cmSTView then
       pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('��������'))].Enabled := false;
  end;

end;

procedure TStructEdit.FillStruct(query: TMalOraQuery; parent: TTreeNode=nil);
var rn:integer;
    n:TTreeNode;
begin

  tvStruct.Tag := query.Tag;

  if query.Tag = frSDIBrowsePresetCopy.tag then
    tvStruct.Images := tvStructImages
  else
    tvStruct.Images := nil;

  query.First;
  while not query.Eof do begin
    if query.FieldValues['pid']=parent.SelectedIndex then begin

      if query.Tag = frSDIBrowsePresetCopy.tag then begin
        sqlTurnOnOff.ParamByName('p_turnOnOff').AsInteger := -1;
        sqlTurnOnOff.ParamByName('p_service_id').AsInteger := query.FieldValues['service_id'];
        sqlTurnOnOff.ParamByName('p_ST_VECTOR_DESCRIPT_ID').AsInteger := ST_VECTOR_DESCRIPT_ID;
        sqlTurnOnOff.Execute;
      end;

      n := tvStruct.Items.AddChild(parent,VarToStr(query.FieldValues['name']));
      n.SelectedIndex := query.FieldValues['service_id'];
      n.StateIndex := query.FieldValues['s_num']; // ��� ������������� ��������� ��� ���������� � ��� ������������ ������
      n.ImageIndex := -1;
      if query.Tag = frSDIBrowsePresetCopy.tag then begin
         n.ImageIndex := sqlTurnOnOff.ParamByName('p_turnOnOff').AsInteger;
         // ���� ������� ������, �� ����������� ����������� �������� ����� �������
         if locVector <> '' then
            n.ImageIndex := StrToInt(copy(locVector,sqlTurnOnOff.ParamByName('p_attr_order_no').AsInteger,1));
      end;

      n.Text := n.Text;
      rn := query.RecNo;
      FillStruct(query, n);
      query.RecNo := rn;
    end;
    query.Next;
  end;
end;

procedure TStructEdit.ChangeElementClick(Sender: TObject);
var tag, idx: integer;
var syncAttr: boolean;
begin
  inherited;

  syncAttr := false;
  tag := aParams.Tag;
  if tag = 0 then
     syncAttr := uMessages.QuestionNo('���������������� ����� ���������');

  idx := tvStruct.Selected.SelectedIndex;
  ShowServiceCard(aParams, tvStruct.Selected.SelectedIndex, cmEdit);
  frSDIBrowsedsBrowseDataChange(nil, nil);
  SelectItem(tvStruct, idx);

  // ��������� ������� �������� ������, ���� ��������� �����. �������� ���� ����������� ��������
  // ������������ ������ ������������ � ���� ��������/��������
  if not ((tag = 0) and (aParams.SDIResult = mrOk)) then
        exit;

  if tag = frSDIBrowseHead.Tag then begin
    sqlUpdatePresetElement.ParamByName('p_service_id').AsInteger := idx;
    sqlUpdatePresetElement.ParamByName('p_service_type_id').AsInteger := LIST_STRUCT_PRESET_ELEMENT_ID;
    sqlUpdatePresetElement.ParamByName('p_sync_attr').AsInteger := IIF(syncAttr, 1, 0);

    sqlUpdatePresetElement.Execute;
    sqlUpdatePresetElement.Session.Commit;
  end;
end;

procedure TStructEdit.ViewElementClick(Sender: TObject);
begin
  inherited;
  ShowServiceCard(aParams, tvStruct.Selected.SelectedIndex, cmView);
end;

procedure TStructEdit.AddElementClick(Sender: TObject);
var idx: integer;
begin
  inherited;

  if not umessages.QuestionNo('������� ����� �������� � ������ <'+tvStruct.Selected.Text+'>. ����������') then exit;

  sqlAddNewElement.ParamByName('P_PARENT_ID').AsInteger := tvStruct.Selected.SelectedIndex;
  sqlAddNewElement.ParamByName('P_PARENT_NAME').AsString := tvStruct.Selected.Text + ' - ����� �������';
  sqlAddNewElement.ParamByName('P_SERVICE_TYPE_ID').AsInteger := LIST_STRUCT_ELEMENT_ID;
  sqlAddNewElement.ParamByName('p_short_name').AsString := '';

  sqlAddNewElement.Execute;
  frSDIBrowsedsBrowseDataChange(nil, nil);

  idx := sqlAddNewElement.ParamByName('P_SERVICE_ID').AsInteger;
  SelectItem(tvStruct, idx);

  ShowServiceCard(aParams, idx, cmEdit);

  frSDIBrowsedsBrowseDataChange(nil, nil);
  SelectItem(tvStruct, idx);
end;

procedure TStructEdit.ShowClosedClick(Sender: TObject);
var idx: integer;
begin
  inherited;
  if aShowClosed = 1 then aShowClosed := 0
  else aShowClosed := 1;
  pmStruct.Items[pmStruct.Items.IndexOf((Sender as TMenuItem))].Checked := (aShowClosed = 1);

  idx := tvStruct.Selected.SelectedIndex;
  frSDIBrowsedsBrowseDataChange(nil, nil);
  SelectItem(tvStruct, idx);

end;

type
   TNodeRecoder = record
   name: String;
   idx: integer;         // id ��������� ��������
   s_num: integer;       // s_num ��������� ��������
   parent_idx: integer;  // id �������� ��������� ��������
   dst_idx: integer;     // id ��������������� ��������
end;

type
  TNode = class
   nodes: array of TNodeRecoder;
  public
   constructor Create(); reintroduce;
   function IndexOf(idx: integer): integer;
   procedure Add(rec: TNodeRecoder);
   function GetCloneParentID(dst_idx: integer): integer;
end;

constructor TNode.Create();
begin
  inherited Create();
  SetLength(nodes,0);
end;

function TNode.IndexOf(idx: integer): integer;
var i: integer;
begin
  result := -1;
  for i := 0 to length(nodes)-1 do begin
    if nodes[i].idx = idx then begin
      result := i;
      exit;
    end;
  end;
end;

// ���������� id �������� � �������������� ���������
// �������� ������ idx (src) - parent_idx (src)
// ����� ������ dst_idx (clone) - parent_idx (src)
function TNode.GetCloneParentID(dst_idx: integer): integer;
var i, j: integer;
begin
  result := -1;
  for i := 0 to length(nodes)-1 do begin
    if nodes[i].dst_idx <> dst_idx then
      continue;

    // ��������� �������� �� id � �������� ���������...
    for j := 0 to length(nodes)-1 do begin
      if nodes[j].idx = nodes[i].parent_idx then begin
        result := nodes[j].dst_idx;  // �����, ���������� id �������� � �������������� ���������
        if nodes[j].dst_idx = -1 then
           result := nodes[j].idx;  // ��� �������� �������
        exit;
      end;
    end;
    exit;
  end;

end;

procedure TNode.Add(rec: TNodeRecoder);
begin
   SetLength(nodes, length(nodes)+1);
   nodes[length(nodes)-1] := rec;
end;

// ������ CreatePresetClick, �� �������� � ����� ������� (service) � � ������� �� ���������
procedure TStructEdit.CreateLocalPresetClick(Sender: TObject);
begin
  inherited;
  CreatePresetClick(Sender);
end;

// ������ CreatePresetClick, �� �������� � ��������� ������� (st_service) � � ������� �� ���������
procedure TStructEdit.DoubleMarkedClick(Sender: TObject);
begin
  inherited;
  CreatePresetClick(Sender);
end;

procedure TStructEdit.CreatePresetClick(Sender: TObject);
var n, np:TTreeNode;
var i, PresetNo, menuTag: integer;
var node: TNode;
var recoder: TNodeRecoder;
var msg: string;
var ListID: TOraNestTable;

procedure AddNode(n: TTreeNode);
begin
  if node.IndexOf(n.SelectedIndex) >= 0 then
    exit;
  recoder.name := n.Text;
  recoder.idx := n.SelectedIndex;
  recoder.s_num := n.StateIndex;

  recoder.parent_idx := -1;
  recoder.dst_idx := -1;
  if Assigned(n.Parent) then
     recoder.parent_idx := n.Parent.SelectedIndex;

  node.Add(recoder);
end;

begin
  menuTag := (Sender as TMenuItem).Tag;
  msg := '����� ����� ����� ����� ������ �� ���������� ���������. ����������';

  if (menuTag = frSDIBrowsePreset.Tag) or (menuTag = frSDIBrowsePresetCopy.Tag) then
     msg := '����� ��������� ����� ����� ������ �� ���������� ���������. ����������'; // �������� ������ - ����� ��������� (service) || ��������� ��������� (st_service)

  if not umessages.QuestionNo(msg) then exit;

  node := TNode.Create;

  // �������� ��� �������� �������, ������� ������������ ���������
  n:=tvStruct.Items.GetFirstNode;
  repeat
    if n.Selected then begin // ���� �������� ���� ���������
       AddNode(n);
       np := n.Parent;
       while Assigned(np) do begin
         AddNode(np);
         np := np.Parent;
       end;
    end;
    n:=n.GetNext;
  until not Assigned(n);

  // ������� ��������� ������� � �������� ��� �� ��������������
  n:=tvStruct.Items.GetFirstNode;

  // ������� ����� �� ���������� � ��������� ����
  if (menuTag = frSDIBrowsePreset.Tag) or (menuTag = frSDIBrowsePresetCopy.Tag) then begin
     ListID := TOraNestTable.Create;
     ListID.CreateObject(aParams.Session.OCISvcCtx, 'cobjects.t_id_list');

     for i := 0 to length(node.nodes)-1 do
         ListID.ItemAsInteger[i] := node.nodes[i].idx;

     sqlCopyPreset.ParamByName('p_prototype_stamp_id').AsInteger :=
        IIF(menuTag = frSDIBrowsePreset.Tag,frSDIBrowsePreset.DataSet['service_id'],frSDIBrowsePresetCopy.DataSet['service_id']);
     sqlCopyPreset.ParamByName('p_list_id').AsObject := ListID;
     sqlCopyPreset.ParamByName('p_source').AsString :=
        IIF(menuTag = frSDIBrowsePreset.Tag,'service','st_service');

     sqlCopyPreset.ParamByName('p_check').AsInteger := 1;
     sqlCopyPreset.Execute;

     // ������� ����������
     if sqlCopyPreset.ParamByName('p_msg').AsString <> '' then begin
        if not umessages.QuestionNo(
           '����� <' + sqlCopyPreset.ParamByName('p_msg').AsString + '> ��� �������� �������� ���������. ������� �����'
        ) then exit;
     end;

     sqlCopyPreset.ParamByName('p_check').AsInteger := 0;
     sqlCopyPreset.Execute;

     umessages.Information(sqlCopyPreset.ParamByName('p_Vector').AsString);

     exit;
  end;

  sqlAddNewElement.ParamByName('P_PARENT_ID').AsInteger :=  n.SelectedIndex;    // flag = service_id �������� ������
  sqlAddNewElement.ParamByName('P_PARENT_NAME').AsString := n.Text + ' - ����� ������';
  sqlAddNewElement.ParamByName('P_SERVICE_TYPE_ID').AsInteger := HEAD_STRUCT_PRESET_GROUP_ID;
  sqlAddNewElement.ParamByName('p_short_name').AsString := '';

  sqlAddNewElement.Execute;

  PresetNo := sqlAddNewElement.ParamByName('P_S_NUM').AsInteger;

  ShowServiceCard(aParams, sqlAddNewElement.ParamByName('P_SERVICE_ID').AsInteger, cmEdit);
  frSDIBrowsePreset.DataSet.Refresh;

  // ��������� �������� "��� ����", ��������� ����� id
  for i := 0 to length(node.nodes)-1 do begin
    node.nodes[i].dst_idx := -1;
    if node.nodes[i].parent_idx = -1 then
       continue;

    sqlAddNewElement.ParamByName('P_PARENT_ID').AsInteger := node.nodes[i].idx;
    sqlAddNewElement.ParamByName('P_PARENT_NAME').AsString :=  node.nodes[i].name;
    sqlAddNewElement.ParamByName('P_SERVICE_TYPE_ID').AsInteger := LIST_STRUCT_PRESET_ELEMENT_ID;
    sqlAddNewElement.ParamByName('P_PRESET_NO').AsInteger := PresetNo;
    sqlAddNewElement.ParamByName('p_short_name').AsString := '';

    sqlAddNewElement.Execute;

    node.nodes[i].dst_idx := sqlAddNewElement.ParamByName('P_SERVICE_ID').AsInteger;
  end;
  //
  for i := 0 to length(node.nodes)-1 do begin
    if node.nodes[i].parent_idx = -1 then
       continue;
    sqlAddNewElement.Session.ExecSQL('update service set short_name = :p_s_num where service_id = :p_service_id',[node.nodes[i].s_num, node.nodes[i].dst_idx]);
  end;

  sqlAddNewElement.Session.Commit;

  for i := 0 to length(node.nodes)-1 do begin
    if node.nodes[i].parent_idx = -1 then
       continue;

    sqlReplaceParent.ParamByName('P_SERVICE_TYPE_ID').AsInteger := LIST_STRUCT_PRESET_ELEMENT_ID;
    sqlReplaceParent.ParamByName('P_PRESET_NO').AsInteger := PresetNo;
    sqlReplaceParent.ParamByName('P_IDX').AsInteger := node.nodes[i].dst_idx;
    sqlReplaceParent.ParamByName('P_PARENT_IDX').AsInteger := node.GetCloneParentID(node.nodes[i].dst_idx);
    sqlReplaceParent.ParamByName('P_SRC_IDX').AsInteger := node.nodes[i].idx;
    sqlReplaceParent.Execute;
  end;

  sqlReplaceParent.Session.Commit;
end;

procedure TStructEdit.frSDIBrowsedsBrowseDataChange(Sender: TObject;
  Field: TField);
var  parent: TTreeNode;
begin
  inherited;
  if frSDIBrowseHead.DataSet.RecordCount = 0 then
    exit;
  if VarToInt(frSDIBrowseHead.DataSet['service_id'],0) = 0 then
    exit;

  // ������� ������ ��������� ��������...
  with quServicePreset do begin
    Close;
    ParamByName('p_service_type_id').AsInteger := HEAD_STRUCT_PRESET_GROUP_ID;
    ParamByName('p_head_service_id').AsInteger := varToInt(frSDIBrowseHead.DataSet['service_id'],0);
    Open;
    frSDIBrowsePreset.UpdateActionStatus;
  end;

  with quStruct do begin
    Close;
    ParamByName('p_reference_id').AsInteger := frSDIBrowseHead.DataSet['service_id'];
    ParamByName('P_LIST_STRUCT_ELEMENT_ID').AsInteger := LIST_STRUCT_ELEMENT_ID;
    ParamByName('P_SHOW_CLOSED').AsInteger := aShowClosed;
    Open;
  end;

  // ������� ���������...
  tvStruct.Items.Clear;
  tvStruct.Items.Add(nil,frSDIBrowseHead.DataSet['name']);
  parent := tvStruct.TopItem;
  parent.SelectedIndex := frSDIBrowseHead.DataSet['service_id'];
  parent.ImageIndex := 1;

  quStruct.Tag := frSDIBrowseHead.Tag;
  FillStruct(quStruct, parent);

  tvStruct.TopItem.Expand(true);
  tvStruct.Color := frSDIBrowseHead.dgrBrowse.Color;
  aParams.Tag :=  frSDIBrowseHead.Tag;
end;

procedure TStructEdit.frSDIBrowsePresetdsBrowseDataChange(Sender: TObject;
  Field: TField);
var  parent: TTreeNode;
begin
  inherited;
  if frSDIBrowsePreset.dgrBrowse.Tag = 1 then exit; // ����� DragDrop On

  if frSDIBrowsePreset.DataSet.RecordCount = 0 then
    exit;
  if VarToInt(frSDIBrowsePreset.DataSet['service_id'],0) = 0 then
    exit;

  // ������� ������ ��������� ����� ��������...
  with quServicePresetCopy do begin
    Close;
    ParamByName('p_service_type_id').AsInteger := HEAD_STRUCT_PRESET_COPY_GROUP_ID;
    ParamByName('p_head_service_id').AsInteger := VarToInt(frSDIBrowsePreset.DataSet['service_id'],0);
    Open;
    frSDIBrowsePresetCopy.UpdateActionStatus;
  end;

  with quStructPreset do begin
    Close;
    ParamByName('p_reference_id').AsInteger := frSDIBrowsePreset.DataSet['flag'];
    ParamByName('P_LIST_STRUCT_ELEMENT_ID').AsInteger := LIST_STRUCT_PRESET_ELEMENT_ID;
    ParamByName('P_SHOW_CLOSED').AsInteger := aShowClosed;
    ParamByName('P_PRESET_NO').AsInteger := VarToInt(frSDIBrowsePreset.DataSet['s_num'],0);
    Open;
    frSDIBrowsePreset.UpdateActionStatus;
  end;

  tvStruct.Items.Clear;
  tvStruct.Items.Add(nil,frSDIBrowsePreset.DataSet['name']);
  parent := tvStruct.TopItem;
  parent.SelectedIndex := frSDIBrowsePreset.DataSet['flag'];
  parent.ImageIndex := 1;

  quStructPreset.Tag := frSDIBrowsePreset.Tag;
  FillStruct(quStructPreset,parent);

  tvStruct.TopItem.Expand(true);
  tvStruct.Color := frSDIBrowsePreset.dgrBrowse.Color;
  aParams.Tag := frSDIBrowsePreset.Tag;
end;

procedure TStructEdit.frSDIBrowsePresetCopydsBrowseDataChange(
  Sender: TObject; Field: TField);
var  parent: TTreeNode;
begin
  inherited;
  if frSDIBrowsePresetCopy.dgrBrowse.Tag = 1 then exit; // ����� DragDrop On

  if frSDIBrowsePresetCopy.DataSet.RecordCount = 0 then
    exit;
  if VarToInt(frSDIBrowsePresetCopy.DataSet['service_id'],0) = 0 then
    exit;

  with quStructPresetCopy do begin
    Close;
    ParamByName('p_reference_id').AsInteger := frSDIBrowsePresetCopy.DataSet['flag_src'];
    ParamByName('P_LIST_STRUCT_ELEMENT_ID').AsInteger := LIST_STRUCT_PRESET_COPY_ELEMENT_ID;
    ParamByName('P_SHOW_CLOSED').AsInteger := aShowClosed;
    ParamByName('P_PRESET_NO').AsInteger := VarToInt(frSDIBrowsePresetCopy.DataSet['s_num'],0);
    Open;
  end;

  tvStruct.Items.Clear;
  tvStruct.Items.Add(nil,frSDIBrowsePresetCopy.DataSet['name']);
  parent := tvStruct.TopItem;
  parent.SelectedIndex := frSDIBrowsePresetCopy.DataSet['flag_src'];
  parent.ImageIndex := 1;

  quStructPresetCopy.Tag := frSDIBrowsePresetCopy.Tag;
  FillStruct(quStructPresetCopy,parent);

  tvStruct.TopItem.Expand(true);
  tvStruct.Color := frSDIBrowsePresetCopy.dgrBrowse.Color;
  aParams.Tag := frSDIBrowsePresetCopy.Tag;
end;


procedure TStructEdit.FormShow(Sender: TObject);
begin
  inherited;
 // frSDIBrowseHead.DataSet.Refresh;
end;

procedure TStructEdit.frSDIBrowsePresetEnter(Sender: TObject);
begin
  inherited;
  frSDIBrowsePreset.DataSet.Refresh;
end;

procedure TStructEdit.frSDIBrowseHeaddgrBrowseEnter(Sender: TObject);
begin
  inherited;
  frSDIBrowseHead.DataSet.Refresh;
end;

procedure TStructEdit.frSDIBrowsePresetCopyEnter(Sender: TObject);
begin
  inherited;
  frSDIBrowsePresetCopy.DataSet.Refresh;
end;

procedure TStructEdit.frSDIBrowsePresetCopyacEditExecute(Sender: TObject);
begin
  ShowServiceCard(aParams, VarToInt(frSDIBrowsePresetCopy.DataSet['service_id'],0), cmEdit);
end;

procedure TStructEdit.frSDIBrowsePresetCopyacViewCardExecute(
  Sender: TObject);
begin
  ShowServiceCard(aParams, VarToInt(frSDIBrowsePresetCopy.DataSet['service_id'],0), cmView);
end;

procedure TStructEdit.frSDIBrowsePresetacInsertExecute(Sender: TObject);
var ListID: TOraNestTable;
begin
  if frSDIBrowsePreset.DataSet['service_id'] <= 0 then exit;

  if not uMessages.QuestionNo('������� ����� ������ <' + frSDIBrowsePreset.DataSet['name'] + '>') then exit;

  ListID := TOraNestTable.Create;
  ListID.CreateObject(aParams.Session.OCISvcCtx, 'cobjects.t_id_list');

  sqlCopyPreset.ParamByName('p_prototype_stamp_id').AsInteger := frSDIBrowsePreset.DataSet['service_id'];
  sqlCopyPreset.ParamByName('p_list_id').AsObject := ListID;
  sqlCopyPreset.ParamByName('p_source').AsString := 'service'; // �������� - ����� �������

  sqlCopyPreset.Execute;

  frSDIBrowsePresetCopy.RefreshDataSet;
end;

procedure TStructEdit.frSDIBrowsePresetdgrBrowseDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var  cell: TGridCoord;
var src: TMalDBGrid;
var n_str: integer;
var parent_s_num, s_num: integer;
var parent_id: integer;
begin
  inherited;

  if (Source as TMalTreeView).Tag <> frSDIBrowsehead.Tag then begin
     uMessages.Error('� ������ ����� ����� �������� ������ �������� �������� �������');
     exit;
  end;

  src := (Sender as TMalDBGrid);
  cell := src.MouseCoord(X,Y);

  if ((cell.Y <= 0) or (cell.Y > src.DataSource.DataSet.RecordCount) or (src.DataSource.DataSet.RecordCount = 0)) then exit;

  if not Assigned(tvStruct.Selected.Parent) then begin
    uMessages.Error('�������� ������� ������ ����������');
    exit;
  end;

  s_num := tvStruct.Selected.StateIndex; // ��� �������� � LIST_STRUCT_ELEMENT_ID (�� ������ ���� � ���������)
  parent_s_num := tvStruct.Selected.Parent.StateIndex; // ��� ������������� �������� � LIST_STRUCT_ELEMENT_ID (������ ���� � ���������)

  frSDIBrowsePreset.dgrBrowse.Tag := 1; // ����� DragDrop On
  n_str := 0;
  src.DataSource.DataSet.first;
  while not src.DataSource.DataSet.Eof do begin
     inc(n_str);
     if n_str = cell.Y then
        break;
     src.DataSource.DataSet.Next;
  end;

  if not uMessages.QuestionNo('�������� ������� <' + tvStruct.Selected.Text + '>' + #10#13 + '� ������ <' + src.DataSource.DataSet['name'] +'>') then begin
     frSDIBrowsePreset.dgrBrowse.Tag := 0; // ����� DragDrop Off
     exit;
  end;

  // �������� ���������� ��������� � ����������, ���������� ����� ������ �����������, �.�. ������� - ��������, ����� - �������
  sqlCheckElement.ParamByName('P_SHORT_NAME').AsString := IntToStr(s_num);
  sqlCheckElement.ParamByName('P_S_NUM').AsInteger := src.DataSource.DataSet['s_num'];
  sqlCheckElement.ParamByName('p_service_type_id').AsInteger := LIST_STRUCT_PRESET_ELEMENT_ID;

  sqlCheckElement.Execute;

  if sqlCheckElement.ParamByName('p_result').AsInteger > 0 then begin
     uMessages.Error('������� ��� ������������ � ���������');
     frSDIBrowsePreset.dgrBrowse.Tag := 0; // ����� DragDrop Off
     exit;
  end;

  parent_id := src.DataSource.DataSet['flag'];
  if parent_s_num > 0 then begin  // ������� �������� ����������� ��������
    sqlCheckElement.ParamByName('P_SHORT_NAME').AsString := IntToStr(parent_s_num);
    sqlCheckElement.ParamByName('P_S_NUM').AsInteger := src.DataSource.DataSet['s_num'];
    sqlCheckElement.ParamByName('p_service_type_id').AsInteger := LIST_STRUCT_PRESET_ELEMENT_ID;

    sqlCheckElement.Execute;

    if sqlCheckElement.ParamByName('p_result').AsInteger = 0 then begin
       uMessages.Error('����������� ������������ �������');
       frSDIBrowsePreset.dgrBrowse.Tag := 0; // ����� DragDrop Off
       exit;
    end;

    if sqlCheckElement.ParamByName('P_PARENT_SERVICE_ID').AsInteger < 0 then begin
       uMessages.Error('������ ����������� ������������� ��������');
       frSDIBrowsePreset.dgrBrowse.Tag := 0; // ����� DragDrop Off
       exit;
    end;
    parent_id := sqlCheckElement.ParamByName('P_PARENT_SERVICE_ID').AsInteger;
  end;

  // �������� ��������� � ��������� �������� �������, ���������:

  sqlAddNewElement.ParamByName('P_PARENT_ID').AsInteger := parent_id; // ������ �� ��������
  sqlAddNewElement.ParamByName('P_PARENT_NAME').AsString := tvStruct.Selected.Text;
  sqlAddNewElement.ParamByName('P_SERVICE_TYPE_ID').AsInteger := LIST_STRUCT_PRESET_ELEMENT_ID; //1518
  sqlAddNewElement.ParamByName('P_PRESET_NO').AsInteger := src.DataSource.DataSet['s_num'];
  sqlAddNewElement.ParamByName('p_short_name').AsString := IntToStr(s_num);

  sqlAddNewElement.Execute;
  sqlAddNewElement.Session.Commit;

  frSDIBrowsePreset.dgrBrowse.Tag := 0; // ����� DragDrop Off
end;

procedure TStructEdit.frSDIBrowsePresetdgrBrowseDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
   //
end;

procedure TStructEdit.tvStructEnter(Sender: TObject);
begin
  inherited;
  tvStruct.DragMode := IIF((aParams.Tag = frSDIBrowseHead.Tag) or (aParams.Tag = frSDIBrowsePreset.Tag),   dmAutomatic, dmManual);
//  tvStruct.DragMode := IIF(aParams.Tag = frSDIBrowsePreset.Tag, dmAutomatic, dmManual);
end;


procedure TStructEdit.frSDIBrowsePresetacSelectExecute(Sender: TObject);
begin
  inherited;
  aSelectedID := VarToInt(frSDIBrowsePreset.DataSet['service_id'],0);
//  ModalResult := mrOk;
  aParams.SDIResult := mrOk;
  Close;
end;

procedure TStructEdit.frSDIBrowsePresetCopyacSelectExecute(
  Sender: TObject);
begin
  inherited;
  aSelectedID := VarToInt(frSDIBrowsePresetCopy.DataSet['service_id'],0);

  if (aSTCardMode = cmSTView) and pRightCenter.Visible then begin // ����� ������, ���������� ������, ����������� �� �������
    sqlGetDefaultVector.ParamByName('p_service_id').AsInteger := aSelectedID;
    sqlGetDefaultVector.Execute;
    locVector :=   sqlGetDefaultVector.ParamByName('p_vector').AsString;
  end;

  aParams.SDIResult := mrOk;
  Close;
end;

procedure TStructEdit.tvStructChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  pmStruct.Items[pmStruct.Items.IndexOf(pmStruct.Items.Find('��������'))].Checked := (Node.ImageIndex = 0);
end;

procedure TStructEdit.TurnOnOffClick(Sender: TObject);
begin
  inherited;
  tvStruct.Selected.ImageIndex := IIF(tvStruct.Selected.ImageIndex = 0, 1, 0);

  if aSTCardMode = cmSTEditVector then begin // ����������� ������ ������ �������, � ���� �� ����������
     // ������� ������� �������� � �������
     sqlTurnOnOff.ParamByName('p_turnOnOff').AsInteger := -1;
     sqlTurnOnOff.ParamByName('p_service_id').AsInteger := tvStruct.Selected.SelectedIndex;
     sqlTurnOnOff.ParamByName('p_ST_VECTOR_DESCRIPT_ID').AsInteger := ST_VECTOR_DESCRIPT_ID;
     sqlTurnOnOff.Execute;

     // ��������� �������� � ������ �������
     locVector[sqlTurnOnOff.ParamByName('p_attr_order_no').AsInteger] := IntToStr(tvStruct.Selected.ImageIndex)[1];
     exit;
  end;

  sqlTurnOnOff.ParamByName('p_turnOnOff').AsInteger := tvStruct.Selected.ImageIndex;
  sqlTurnOnOff.ParamByName('p_service_id').AsInteger := tvStruct.Selected.SelectedIndex;
  sqlTurnOnOff.ParamByName('p_ST_VECTOR_DESCRIPT_ID').AsInteger := ST_VECTOR_DESCRIPT_ID;

  sqlTurnOnOff.ParamByName('p_reference_id').AsInteger := frSDIBrowsePresetCopy.DataSet['flag_src'];
  sqlTurnOnOff.ParamByName('P_PRESET_NO').AsInteger := VarToInt(frSDIBrowsePresetCopy.DataSet['s_num'],0);
  sqlTurnOnOff.ParamByName('p_head_service_id').AsInteger := frSDIBrowsePresetCopy.DataSet['service_id'];

  sqlTurnOnOff.Execute;
end;

procedure TStructEdit.frSDIBrowsePresetCopydgrBrowseDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var  cell: TGridCoord;
var src: TMalDBGrid;
var n_str: integer;
var parent_idx, idx: integer;
var parent_id: integer;
begin
  inherited;

  if (Source as TMalTreeView).Tag <> frSDIBrowsePreset.Tag then begin
     uMessages.Error('� ������ ����� ����� �������� ������ �������� ��������� �������');
     exit;
  end;

  src := (Sender as TMalDBGrid);
  cell := src.MouseCoord(X,Y);

  if ((cell.Y <= 0) or (cell.Y > src.DataSource.DataSet.RecordCount) or (src.DataSource.DataSet.RecordCount = 0)) then exit;

  if not Assigned(tvStruct.Selected.Parent) then begin
    uMessages.Error('�������� ������� ������ ����������');
    exit;
  end;

  idx := tvStruct.Selected.SelectedIndex;                 // id ������������ ��������
  parent_idx := tvStruct.Selected.Parent.SelectedIndex;   // id �������� ������������ ��������

  frSDIBrowsePresetCopy.dgrBrowse.Tag := 1; // ����� DragDrop On
  n_str := 0;
  src.DataSource.DataSet.first;
  while not src.DataSource.DataSet.Eof do begin
     inc(n_str);
     if n_str = cell.Y then
        break;
     src.DataSource.DataSet.Next;
  end;

  if not uMessages.QuestionNo('�������� ������� <' + tvStruct.Selected.Text + '>' + #10#13 + '� ������ <' + src.DataSource.DataSet['name'] +'>') then begin
     frSDIBrowsePresetCopy.dgrBrowse.Tag := 0; // ����� DragDrop Off
     exit;
  end;

  // �������� ���������� ��������� � ����������, ���������� ����� ������ �����������, �.�. ������� - ��������, ����� - �������
  sqlCheckElement_ST.ParamByName('P_attr_group_no').AsInteger := idx;
  sqlCheckElement_ST.ParamByName('P_RESERVED1').AsInteger := src.DataSource.DataSet['s_num'];
  sqlCheckElement_ST.ParamByName('p_service_type_id').AsInteger := LIST_STRUCT_PRESET_COPY_ELEMENT_ID;  // 1520
  sqlCheckElement_ST.ParamByName('p_attr_type_id').AsInteger := ST_VECTOR_DESCRIPT_ID;

  sqlCheckElement_ST.Execute;

  if sqlCheckElement_ST.ParamByName('p_result').AsInteger > 0 then begin
     uMessages.Error('������� ��� ������������ � ���������');
     frSDIBrowsePresetCopy.dgrBrowse.Tag := 0; // ����� DragDrop Off
     exit;
  end;

  // �������� ���������� ��������� � ����������, ���������� ����� ������ �����������, �.�. ������� - ��������, ����� - �������
  if parent_idx <> src.DataSource.DataSet['flag_src'] then begin // ���������� ������� - ��������� ������� ���������
    sqlCheckElement_ST.ParamByName('P_attr_group_no').AsInteger := parent_idx;
    sqlCheckElement_ST.Execute;

    if sqlCheckElement_ST.ParamByName('p_result').AsInteger <= 0 then begin
       uMessages.Error('����������� ������������ �������');
       frSDIBrowsePresetCopy.dgrBrowse.Tag := 0; // ����� DragDrop Off
       exit;
    end;

   if sqlCheckElement_ST.ParamByName('P_PARENT_SERVICE_ID').AsInteger < 0 then begin
      uMessages.Error('������ ����������� ������������� ��������');
      frSDIBrowsePreset.dgrBrowse.Tag := 0; // ����� DragDrop Off
      exit;
    end;
    parent_id := sqlCheckElement_ST.ParamByName('P_PARENT_SERVICE_ID').AsInteger;
  end else
    parent_id := parent_idx;

  // �������� ��������� � ��������� �������� �������, ���������:
  sqlAddNewElement.ParamByName('P_PARENT_ID').AsInteger := parent_id; // ������ �� ��������
  sqlAddNewElement.ParamByName('P_PARENT_NAME').AsString := tvStruct.Selected.Text;
  sqlAddNewElement.ParamByName('P_SERVICE_TYPE_ID').AsInteger := LIST_STRUCT_PRESET_COPY_ELEMENT_ID;  // 1520
  sqlAddNewElement.ParamByName('P_PRESET_NO').AsInteger := src.DataSource.DataSet['s_num'];   // RESERVED1      +
  sqlAddNewElement.ParamByName('p_short_name').AsString := IntToStr(idx);
  sqlAddNewElement.ParamByName('P_ST_VECTOR_DESCRIPT_ID').AsInteger := ST_VECTOR_DESCRIPT_ID;  // 1520
  sqlAddNewElement.ParamByName('p_reference_id').AsInteger := src.DataSource.DataSet['flag_src'];   //
  sqlAddNewElement.ParamByName('p_head_service_id').AsInteger := src.DataSource.DataSet['service_id'];


  sqlAddNewElement.Execute;
//  sqlAddNewElement.Session.Commit;

  frSDIBrowsePresetCopy.dgrBrowse.Tag := 0; // ����� DragDrop Off
end;

procedure TStructEdit.frSDIBrowsePresetCopydgrBrowseDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  //
end;

end.



