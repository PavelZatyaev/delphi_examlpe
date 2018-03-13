unit fuRwWagonDislocationEx;

interface

uses Types,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FUBASESDIFORM, ExtCtrls, MalStdCtrls, StdCtrls, ComCtrls,
  MalComCtrls, muSDIBrowse, DB, MemDS, DBAccess, Ora, MalOraDataSet,
  BrowseParams, VirtualTable, uGridStateMgr2, Buttons, MalAdditionalButtons,
  OraPackage, MalOraNonVisual, fuBaseSDICardForm, Menus, MalStdMenus, Mask,
  DBCtrlsEh, MalDBComboBoxs, DBCtrls, MalRefButton,Grids,DbGridEh,
  fuRwWagonOperation, MalDBStdControls, uMalGridLegend, ColorGrd,
  DBLookupEh, MalStdButtons, UCrpeDS, UCrpeClasses, UCrpe32, MalDBEdits, MalDBGrid, fuShowLegend,
  MalAdditionalExtCtrls, uCommonTypes
  ,dbGrids;

type
   TOperation = (internalRePosition, externalRePosition, nextStep, backStep);

type
  TfmRwWagonDislocationEx = class(TfmBaseSDIForm)
    MalPanel5: TMalPanel;
    pLeft: TMalPanel;
    pMiddle: TMalPanel;
    pRight: TMalPanel;
    VirtualTable: TMalVirtualTable;
    BrowseRefParams: TBrowseRefParams;
    quSelectedWagon: TMalOraQuery;
    quLastOrderInList: TMalOraQuery;
    pkRailway_System: TMalOraPackage;
    quClearListWagon: TMalOraSqL;
    frPlace_1: TfrSDIBrowse;
    frPlace_2: TfrSDIBrowse;
    frPlace_3: TfrSDIBrowse;
    frSelectedList_2: TfrSDIBrowse;
    quSelectMainPlace: TMalOraQuery;
    quGetPlaceStr_ID: TMalOraQuery;
    sqlInsertWagonOperation: TMalOraSqL;
    sqlDeleteWagonOperation: TMalOraSqL;
    quGetLastOrderInTrain: TMalOraQuery;
    sqlReorderWagons: TMalOraSqL;
    quPlace_1: TMalOraQuery;
    quPlace_2: TMalOraQuery;
    quPlace_3: TMalOraQuery;
    sqlChangeOrderInListDown: TMalOraSqL;
    sqlChangeOrderInListUp: TMalOraSqL;
    MalSpeedButton1: TMalSpeedButton;
    MalSpeedButton2: TMalSpeedButton;
    MalMainMenu1: TMalMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    quUniSubclient: TMalOraQuery;
    dsUniSubclient: TMalOraDataSource;
    dsUniWagonOwners: TMalOraDataSource;
    quUniWagonOwners: TMalOraQuery;
    sqlExcludeWagonsFromList: TMalOraSqL;
    Panel4: TPanel;
    cbxUniWagonOwner: TMalStdDBLookupComboBox;
    cbxUniSubclient: TMalStdDBLookupComboBox;
    rgType_Disloc: TRadioGroup;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    rbWagonAction: TMalRefButton;
    laWagonAction: TMalLabel;
    quSelectPlaces: TMalOraQuery;
    sqlForUshpt: TMalOraQuery;
    quSelectedWagon_Drag: TMalOraQuery;
    sqlInsertWagonOperationUSHPT: TMalOraSqL;
    pcMain: TMalPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    frShptPlaces: TfrSDIBrowse;
    frBrowseRwWagonList: TfrSDIBrowse;
    frSelectedList: TfrSDIBrowse;

    Panel9: TPanel;
    Panel10: TPanel;
    OneRight: TMalBitBtn;
    OneLeft: TMalBitBtn;
    CommonRight: TMalBitBtn;
    CommonLeft: TMalBitBtn;
    Panel1: TPanel;
    gsm_RwWagonList: TMalGridStateMgr2;
    rgOperationMode: TRadioGroup;
    Panel2: TPanel;
    frRwWagonOperationShow: TfrRwWagonOperation;
    cbWagonExistOnly: TCheckBox;
    sqlInsertIntoTmpID: TMalOraSqL;
    sqlMakeSignForShpt: TMalOraSqL;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel11: TPanel;
    Wagon_Status_Name_1: TMalDBText;
    Wagon_Status_Name_3: TMalDBText;
    laSelected_WS_2: TLabel;
    gsmShptPlaces: TMalGridStateMgr2;
    rbCargoGrp: TMalRefButton;
    laCargoGroup: TMalLabel;
    quRwDislocationUsers: TMalOraQuery;
    sqlDeleteRwDislocationUsers: TMalOraSqL;
    sqlInsertRwDislocationUsers: TMalOraSqL;
    Wagon_Status_Name_WS: TMalDBText;
    Panel12: TPanel;
    Wagon_Status_Name_WS_2: TMalDBText;
    sqlDeleteTmpID: TMalOraSqL;
    tmrRefresh: TTimer;
    laSelected_WS: TLabel;
    bbClearBuffer: TMalBitBtn;
    sqlInsertWagonOperationSubClient: TMalOraSqL;
    cbShowAllWagons: TCheckBox;
    SetNote: TMenuItem;
    ClearNote: TMenuItem;
    sqlSetDislocNote: TMalOraSqL;
    N6: TMenuItem;
    SetNote_1: TMenuItem;
    Clear_Note_1: TMenuItem;
    SetNote_2: TMenuItem;
    Clear_Note_2: TMenuItem;
    N7: TMenuItem;
    SetNote_3: TMenuItem;
    ClearNote_3: TMenuItem;
    N10: TMenuItem;
    ADD_DISLOCATION_NOTE_1: TMalDBText;
    ADD_DISLOCATION_NOTE_3: TMalDBText;
    Panel13: TPanel;
    Label1: TLabel;
    btSetForShptSign: TButton;
    btClearForShptSign: TButton;
    laForSHptSign: TLabel;
    rbSignForSHPT: TMalRefButton;
    Label2: TLabel;
    edWagonList: TMalEdit;
    rbFilterByList: TMalRefButton;
    cbOnlyArrived: TCheckBox;
    cbShowByAllPlaceStr: TCheckBox;
    MalGridLegend1: TMalGridLegend;
    ColorGridWagonlist: TColorGrid;
    sqlSetColor: TMalOraSqL;
    sqlUniquePlaces: TMalOraSqL;
    rgType_Places: TRadioGroup;
    sqlWagonIsFull: TMalOraQuery;
    sqlWagonIsEmpty: TMalOraQuery;
    quWagonState: TMalOraQuery;
    dsWagonState: TMalOraDataSource;
    Label4: TLabel;
    cbxWagonStatus: TMalDBLookupComboBox;
    cbWagonsForExternalPlace: TCheckBox;
    Label5: TLabel;
    btMoveToExternalPlace: TButton;
    Panel14: TPanel;
    Label3: TLabel;
    btExecTimeByInit: TMalBitBtn;
    dtpDate_In: TMalDateTimePicker;
    dtpTime_In: TMalDateTimePicker;
    MalLabel2: TMalLabel;
    btSetlocomotive: TMalRefButton;
    laLocomotiveName: TMalLabel;
    SqlInsertWagonOperToExternalPlace: TMalOraSqL;
    N5: TMenuItem;
    N8: TMenuItem;
    rgWagonOwner: TMalRadioGroup;
    cbShptWithApprovalDate: TCheckBox;
    rgCargoOper: TRadioGroup;
    cbCommerceError: TCheckBox;
    acClearFilter1: TMenuItem;
    Label6: TLabel;
    N9: TMenuItem;
    Button1: TButton;
    In_Subclient_Name: TMalDBText;
    Label7: TLabel;
    rpWagonList: TCrpe;
    cdsWagonList: TCrpeDS;
    rgPlaceNo: TRadioGroup;
    edWagonNO: TMalEdit;
    rgInsertMode: TRadioGroup;
    N11: TMenuItem;
    ResortMode: TMenuItem;
    sqlDeleteTmpID_Date: TMalOraSqL;
    sqlInsertIntoTmpID_Date: TMalOraSqL;
    sqlSearhByWagonNo: TMalOraQuery;
    btSetWagonNoOrder: TButton;
    Label9: TLabel;
    btSearhByWagonNo: TMalRefButton;
    cbxSearhByWagonNo: TMalDBLookupComboBox;
    dsSearhByWagonNo: TMalOraDataSource;
    laRecordFound: TLabel;
    quSelectMainPlaceLight: TMalOraQuery;
    cbLightShow: TMalCheckBox;
    ColorGridPlaces: TColorGrid;
    laRwFilter: TMalLabel;
    rbRailWays: TMalRefButton;
    laRWNAME: TMalLabel;
    sqlLoadToTmpTable: TMalOraSqL;
    btRecallData: TButton;
    quSelectRwWagonList: TMalOraQuery;
    sqlGetFilteredPlaces: TMalOraSqL;
    sqlReorderWagonsAll: TMalOraSqL;
    N12: TMenuItem;
    cbShowWaitingForUShpt: TCheckBox;
    sqlWaitingToUshptMove: TMalOraSqL;
    sqlDeleteRwDislocationCurrentUsers: TMalOraSqL;
    sqlGetChain: TMalOraSqL;
    sqlMoveUpDown: TMalOraSqL;
    mStack: TMemo;
    sqlWagonRePosition: TMalOraSqL;
    btRollback: TBitBtn;
    sqlGetHash: TMalOraSqL;
    pHeader_1: TPanel;
    laSelected_1: TLabel;
    laOperation_MODE_1: TLabel;
    In_Subclient_Name_1: TMalDBText;
    laPlace_1: TLabel;
    laPlaceStr_1: TLabel;
    rbSelectPlace_1: TMalRefButton;
    sb1Down: TMalSpeedButton;
    sb1Up: TMalSpeedButton;
    pHeader_2: TPanel;
    In_Subclient_Name_2: TMalDBText;
    laOperation_MODE_2: TLabel;
    laPlace_2: TLabel;
    laPlaceStr_2: TLabel;
    rbSelectPlace_2: TMalRefButton;
    sb2Down: TMalSpeedButton;
    sb2Up: TMalSpeedButton;
    laSelected_2: TLabel;
    pHeader_3: TPanel;
    rbSelectPlace_3: TMalRefButton;
    In_Subclient_Name_3: TMalDBText;
    laPlace_3: TLabel;
    laPlaceStr_3: TLabel;
    sb3Down: TMalSpeedButton;
    laOperation_MODE_3: TLabel;
    laSelected_3: TLabel;
    sb3Up: TMalSpeedButton;
    spExpand_1: TMalSpeedButton;
    spExpand_2: TMalSpeedButton;
    spExpand_3: TMalSpeedButton;
    gsmPlaceState: TMalGridStateMgr2;
    pmBrowseState_1: TMalPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    pmiSeparator: TMenuItem;
    pmiDoubleRecord: TMenuItem;
    pmiSeparator2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    pmiSeparator3: TMenuItem;
    pmiFilterCurrValue: TMenuItem;
    pmiFilterNotCurrValue: TMenuItem;
    pmiSeparator4: TMenuItem;
    pmiFilterMSelect: TMenuItem;
    pmiFilterNotMSelect: TMenuItem;
    pmiBottomSeparator: TMenuItem;
    pmiMultiSelect: TMenuItem;
    pmiSelectWork: TMenuItem;
    pmiSelectAll: TMenuItem;
    pmiUnSelectAll: TMenuItem;
    pmiReverseSelect: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    pmBrowseState_2: TMalPopupMenu;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem51: TMenuItem;
    MenuItem52: TMenuItem;
    MenuItem53: TMenuItem;
    MenuItem54: TMenuItem;
    MenuItem55: TMenuItem;
    pmBrowseState_3: TMalPopupMenu;
    Legend_1: TImage;
    Legend_2: TImage;
    Legend_3: TImage;
    sqlGetTrainStatus: TMalOraSqL;
    sqlSearhByWagonNoDSL: TMalOraSqL;
    spFindWagon_1: TMalSpeedButton;
    spFindWagon_2: TMalSpeedButton;
    spFindWagon_3: TMalSpeedButton;
    quPlace_4: TMalOraQuery;
    edSearhWagonNo: TMalDBEdit;
    pMiddleUP: TMalPanel;
    msMiddleSplitter: TMalSplitter;
    pMiddleLOW: TMalPanel;
    ClaimOutput01: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    sqlSetClaim: TMalOraSqL;
    cbTempOutput_1: TCheckBox;
    cbTempOutput_2: TCheckBox;
    cbTempOutput_3: TCheckBox;
    N13: TMenuItem;
    mnBackToWorkshop01: TMenuItem;
    mnComplitOutput: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    sqlWagonInto: TMalOraSqL;
    sqlWagonFree: TMalOraSqL;
    cbBufferMode: TMalComboBox;
    Label8: TLabel;
    cbBufferAsFilter: TMalCheckBox;
    N20_1: TMenuItem;
    N22_1: TMenuItem;
    newTrain_1: TMenuItem;
    addTrain01_1: TMenuItem;
    addTrain02_1: TMenuItem;

    N20_2: TMenuItem;
    N22_2: TMenuItem;
    newTrain_2: TMenuItem;
    addTrain01_2: TMenuItem;
    addTrain02_2: TMenuItem;

    N20_3: TMenuItem;
    N22_3: TMenuItem;
    newTrain_3: TMenuItem;
    addTrain01_3: TMenuItem;
    addTrain02_3: TMenuItem;
    sqlSetTrain: TMalOraSqL;
    sqlGetStationName: TMalOraSqL;
    sqlLockSet: TMalOraSqL;
    sqlLockClear: TMalOraSqL;
    sqlLockCheck: TMalOraSqL;
    bCreateChains: TButton;
    sqlCreateChains: TMalOraSqL;
    tPlace1: TTimer;
    bRebuildChain: TButton;
    sqlRebuildChains: TMalOraSqL;
    N20: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N38: TMenuItem;
    N30: TMenuItem;
    N32: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    bConvertBase: TButton;
    sqlConvertBase: TMalOraSqL;
    bAddInnerWagon: TButton;
    sqlAddInnerWagon: TMalOraSqL;
    sqlGetDateTimeChange: TMalOraSqL;

    procedure OneRightClick(Sender: TObject);
    procedure OneLeftClick(Sender: TObject);
    procedure CommonRightClick(Sender: TObject);
    procedure CommonLeftClick(Sender: TObject);
    procedure quSelectedWagonAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure frPlace_1acViewCardExecute(Sender: TObject);
    procedure frPlace_2acViewCardExecute(Sender: TObject);
    procedure frSelectedListacViewCardExecute(Sender: TObject);
    procedure frPlace_3acViewCardExecute(Sender: TObject);
    procedure sb1DownClick(Sender: TObject);
    procedure sb1UpClick(Sender: TObject);
    procedure sb2UpClick(Sender: TObject);
    procedure sb2DownClick(Sender: TObject);
    procedure sb3UpClick(Sender: TObject);
    procedure sb3DownClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure cbxUniSubclientChange(Sender: TObject);
    procedure frBrowseRwWagonListacClearFilterExecute(Sender: TObject);
    procedure cbxUniWagonOwnerChange(Sender: TObject);
    procedure rbFilterByListBrowseButtonClick(Sender: TObject);
    procedure rbFilterByListCleanButtonClick(Sender: TObject);
    procedure frBrowseRwWagonListdgrBrowseGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure rgType_DislocClick(Sender: TObject);
    procedure rbWagonActionCleanButtonClick(Sender: TObject);
    procedure rbWagonActionBrowseButtonClick(Sender: TObject);
    procedure frShptPlacesdgrBrowseCanSelectRecord(Sender: TObject;
      var CanSelectRow: Boolean);
    procedure frBrowseRwWagonListacViewCardExecute(Sender: TObject);
    procedure frPlace_1dgrBrowseDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure frPlace_1dgrBrowseDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure btExecTimeByInitClick(Sender: TObject);
    procedure btSetlocomotiveBrowseButtonClick(Sender: TObject);
    procedure btSetlocomotiveCleanButtonClick(Sender: TObject);
    procedure frBrowseRwWagonListdgrBrowseMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure frBrowseRwWagonListacEditExecute(Sender: TObject);
    procedure frPlace_1dgrBrowseMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure rbSelectPlace_1BrowseButtonClick(Sender: TObject);
    procedure rbSelectPlace_1CleanButtonClick(Sender: TObject);
    procedure rgOperationModeClick(Sender: TObject);
    procedure rbSelectPlace_3CleanButtonClick(Sender: TObject);
    procedure rbSelectPlace_2CleanButtonClick(Sender: TObject);
    procedure rbSelectPlace_2BrowseButtonClick(Sender: TObject);
    procedure rbSelectPlace_3BrowseButtonClick(Sender: TObject);
    procedure frBrowseRwWagonListdsBrowseDataChange(Sender: TObject;
      Field: TField);
    procedure frShptPlacesdsBrowseDataChange(Sender: TObject;
      Field: TField);
    procedure quSelectPlacesAfterOpen(DataSet: TDataSet);
    procedure cbShowAllWagonsClick(Sender: TObject);
    procedure frPlace_1dgrBrowseMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure frPlace_1dgrBrowseSelectRecord(Sender: TObject;
      const SelectRow: Boolean);
    procedure frSelectedList_2dgrBrowseDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure frSelectedList_2dgrBrowseDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure frSelectedList_2dgrBrowseMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure frSelectedList_2acViewCardExecute(Sender: TObject);
    procedure cbWagonExistOnlyClick(Sender: TObject);
    procedure rbSignForSHPTCleanButtonClick(Sender: TObject);
    procedure rbSignForSHPTBrowseButtonClick(Sender: TObject);
    procedure btSetForShptSignClick(Sender: TObject);
    procedure btClearForShptSignClick(Sender: TObject);
    procedure frPlace_1acEditExecute(Sender: TObject);
    procedure frPlace_1dgrBrowseGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure frPlace_2dgrBrowseGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure frPlace_3dgrBrowseGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure frPlace_2acEditExecute(Sender: TObject);
    procedure frPlace_3acEditExecute(Sender: TObject);
    procedure frPlace_1acDeleteExecute(Sender: TObject);
    procedure frPlace_2acDeleteExecute(Sender: TObject);
    procedure frPlace_3acDeleteExecute(Sender: TObject);
    procedure frSelectedList_2dgrBrowseSelectRecord(Sender: TObject;
      const SelectRow: Boolean);
    procedure frSelectedListdgrBrowseSelectRecord(Sender: TObject;
      const SelectRow: Boolean);
    procedure quPlace_1AfterOpen(DataSet: TDataSet);
    procedure cbShowByAllPlaceStrClick(Sender: TObject);
    procedure rbCargoGrpCleanButtonClick(Sender: TObject);
    procedure rbCargoGrpBrowseButtonClick(Sender: TObject);
    procedure rbRailWaysCleanButtonClick(Sender: TObject);
    procedure rbRailWaysBrowseButtonClick(Sender: TObject);
    procedure frSelectedList_2dgrBrowseMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure frPlace_1dgrBrowseCanSelectRecord(Sender: TObject;
      var CanSelectRow: Boolean);
    procedure frPlace_1acRefreshExecute(Sender: TObject);
    procedure brReorder_1Click(Sender: TObject);
    procedure brReorder_2Click(Sender: TObject);
    procedure brReorder_3Click(Sender: TObject);
    procedure cbOnlyArrivedClick(Sender: TObject);
//    procedure quPlace_2AfterOpen(DataSet: TDataSet);
  //  procedure quPlace_3AfterOpen(DataSet: TDataSet);
    procedure quSelectRwWagonList_OLDAfterOpen(DataSet: TDataSet);
    procedure pcMainChange(Sender: TObject);
    procedure SetNoteClick(Sender: TObject);
    procedure ClearNoteClick(Sender: TObject);
    procedure SetNote_1Click(Sender: TObject);
    procedure Clear_Note_1Click(Sender: TObject);
    procedure ColorGridWagonlistClick(Sender: TObject);
    procedure ColorGridPlacesClick(Sender: TObject);
    procedure rgType_PlacesClick(Sender: TObject);
    procedure cbxWagonStatusChange(Sender: TObject);
    procedure cbWagonsForExternalPlaceClick(Sender: TObject);
    procedure btMoveToExternalPlaceClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure rgWagonOwnerClick(Sender: TObject);
    procedure cbShptWithApprovalDateClick(Sender: TObject);
    procedure rgCargoOperClick(Sender: TObject);
    procedure cbCommerceErrorClick(Sender: TObject);
    procedure rbSelectPlace_1ShowRecordButtonClick(Sender: TObject);
    procedure rbSelectPlace_2ShowRecordButtonClick(Sender: TObject);
    procedure rbSelectPlace_3ShowRecordButtonClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure frPlace_1acPrintExecute(Sender: TObject);
    procedure frPlace_2acPrintExecute(Sender: TObject);
    procedure frPlace_3acPrintExecute(Sender: TObject);
    procedure btSetWagonNoOrderClick(Sender: TObject);
    procedure ResortModeClick(Sender: TObject);
    procedure rgInsertModeClick(Sender: TObject);
    procedure btSearhByWagonNoBrowseButtonClick(Sender: TObject);
    procedure edSearhWagonNo1Exit(Sender: TObject);
    procedure edSearhWagonNo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btSearhByWagonNoCleanButtonClick(Sender: TObject);
    procedure cbLightShowClick(Sender: TObject);
    procedure frShptPlacesacRefreshExecute(Sender: TObject);
    procedure btRecallDataClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure cbShowWaitingForUShptClick(Sender: TObject);
    procedure frPlace_2dgrBrowseTitleBtnClick(Sender: TObject;
      ACol: Integer; Column: TColumnEh);
    procedure quPlace_2BeforeOpen(DataSet: TDataSet);
    procedure quPlace_1BeforeOpen(DataSet: TDataSet);
    procedure quPlace_3BeforeOpen(DataSet: TDataSet);
    procedure btRollbackClick(Sender: TObject);
    procedure frPlace_2dgrBrowseDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure spExpand_1Click(Sender: TObject);
    procedure showAllPoints;
    procedure frPlace_3dgrBrowseDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure frPlace_1dgrBrowseDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spFindWagon_1Click(Sender: TObject);
    procedure frSelectedList_2dgrBrowseDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure frSelectedList_2N2Click(Sender: TObject);
    procedure ClaimOutput01Click(Sender: TObject);
    procedure mnBackToWorkshop01Click(Sender: TObject);
    procedure mnComplitOutputClick(Sender: TObject);
    procedure cbBufferModeKeyPress(Sender: TObject; var Key: Char);
    procedure cbBufferModeChange(Sender: TObject);
    procedure cbBufferAsFilterClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure newTrain_1Click(Sender: TObject);
    procedure pmBrowseState_1Popup(Sender: TObject);
    procedure addTrain01_1Click(Sender: TObject);
    procedure addTrain02_1Click(Sender: TObject);
    procedure setTrain(opID, train_number: string);
    procedure frSelectedList_2ToolButton11Click(Sender: TObject);
    procedure bCreateChainsClick(Sender: TObject);
    procedure quPlace_1BeforeInsert(DataSet: TDataSet);
    procedure tPlace1Timer(Sender: TObject);
    procedure bRebuildChainClick(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure dgrBrowseColumns44NotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure SetReasonStr(str: string; aPlaceNo: integer);
    procedure bConvertBaseClick(Sender: TObject);
    procedure bAddInnerWagonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    LSession          : TOraSession ;

    Loc_Place_ID       : Integer;
    Loc_Place_Str_NO   : Integer;
    Loc_Operation_MODE : Integer;
    Loc_Gdc_Place_ID   : Integer;

    F_UpdateMode          : Integer;
    Loc_WagonActionSID    : Integer;

    loc_WagonListStr      : String;
    loc_CommaCountStr     : String;

    L_PLACE_WS_SELECTED   : Integer;
    L_PLACE_WS_2_SELECTED : Integer;

    L_Move_From_WL        : Integer;

    LOC_LOCOMOTIVE_SID    : Integer;
    Loc_CargoGroupID      : Integer;

    F_FULL_REOPEN         : Integer;
    F_LIMIT_UNI_PLACES    : Integer;

    LOC_FOR_SHPT_PLACE_ID     : Integer;
    LOC_FOR_SHPT_PLACE_STR_ID : Integer;
    LOC_FOR_SHPT_PLACE_STR_NO : Integer;

    F_IDLE_ALGORITM     : Integer;
    F_Permit_Admin      : Boolean;

    Rw_STR              : String;
    Rw_STR_NAME         : String;

    L_State_ID          : Integer;

    Glo_Order_BY_Cursor : Integer;
    Loc_ResortModeEnabled : Integer;

    // =========
    flowBufferMode: string;
    wasShowOperation: boolean; // признак открытия формы операции по двойному щелчку

    function GetDataTime(const aDate: TDate; const aTime: TTime): TDateTime;
    function GetSetupDateTime : TDateTime;
    property SetupDateTime    : TDateTime  read GetSetupDateTime;

    procedure  InitLocalFrames();
    procedure  ReopenMainQuery();
    procedure  Update_Local_QueryPlaces();
    procedure  UpdateAll_QueryPlaces();
    procedure  LoadParams(AParams: TBrowseRefParams);
    procedure  AfterUpdateWagonListActionStatus(Sender: TObject);
    procedure  UpdateMain_Query_Place(aPlace_ID:Integer; aPlace_Str_NO:Integer; aPlace_Str_ID:Integer; Loc_Grid_Number: integer);
    function   GetPlaceStrID(aRowNum:Integer; var aPlace_ID: Integer; var aOperaionMode: Integer; var aPlace_Str_ID: Integer) :Integer;
    procedure  UpdateQuery_Place(aPlaceNo:Integer);
    procedure  ArrowUpDownPressed(aPlaceNo:Integer; aMoveOrder:Integer);
    procedure  UpdateDataSubClient;
    procedure  UpdateDataWagonOwner;
    procedure SaveToIniFileParams();
    procedure LoadIniParams();
    procedure ShowPlaceValues(aPlaceNo: Integer);
    procedure UpdateQueryDislocationPlaces();
    procedure ClearPlaceValues(aPlaceNo:Integer);

    procedure MakeOperationSignFormShpt(aMode:Integer);

    procedure LockReleasePlace(aPlaceNo:Integer);
    function  PlaceIsLocked(PlaceID: integer; interactive : boolean = false) : boolean;
    procedure SetPlaceDSL(PlaceNo, PlaceID: integer);
    procedure SetCauseNote(aCauseStr: String; aMode: Integer; aFrameID: Integer);
    procedure SetColorByWagon () ;
    procedure Print_Report_Disclocation_Place( aPlaceNo: Integer);
    procedure btReorderClick(aPlaceNo: Integer);

    procedure Print_Report_Disclocation_Place_Excel(aPlaceNo:Integer);
    procedure AutoRangeMergedHeight(Excel, Range: Variant);

    //////////////////
    procedure rePosition(Sender,Source: TObject; X, Y: Integer);
    function checkTime: boolean;

    function  getHash(placeID: integer = 0; timePoint: TDateTime = 0; operID: integer = 0): string;
    procedure rollbackProcess(op: TOperation;
      placeFrom: integer = 0;  placeTo: integer = 0;
      placeFromW: integer = 0; placeToW: integer = 0;
      hashPlaceFrom: string = '';  hashPlaceTo: string = '';  rb: string = '');

    function get_frPlace(aPlaceNo:Integer): TfrSDIBrowse;
    procedure getStatusArr(var arr: array of integer; fr: TfrSDIBrowse);

    function getWagonPlace(src: TfrSDIBrowse): integer;
    procedure showOperation(BrowseRefParams: TBrowseRefParams; src: TfrSDIBrowse; aCardMode: TCardMode = cmEdit);
  public
    { Public declarations }
  end;

procedure RwWagonDislocationEx(AParams: TBrowseRefParams);

const
  CRLF   = #10#13;
  mvDown = 1;
  mvUp   = 2;
  REGISTRY_ROOT_PATH ='\Software\Malahit\GDC\RwWagonListDislocation\Settings';
  BUFFER_PLACE = 4;

  OP_MOVEMENT   = 2900001;
  OP_UNSHIPMENT = 2900002;
    OP_SHIPMENT = 2900003;

type
   TPlaceDescription = record
      hash: string;  // хеш для контроля внешних изменений на точке
      DateTimeChange: TDateTime; // время внешних изменений (прибытие/убытие) на точке

      L_PLACE_STR_ID: integer;
      L_PLACE_OPERATION: integer;
      freshRepositionListID: string;
      foundListID:  string;
      operation: TStringList;
      subclient: integer;
      L_PLACE_WAGON_QNTY: integer;

      lblSelected: TLabel;
      lblPlace: TLabel;
      lblPlaceStr: TLabel;       //**
      laPlaceName: string;

      lblOperation_MODE: TLabel; //**
      cbTempOutput: TCheckBox;
      legend: TBitMap;
      imLegend: TImage;

      quPlace: TMalOraQuery;
      frPlace: TfrSDIBrowse;

      PlaceIsLocked: boolean;

      timeRefresh: tDateTime;     // подготовка к автоматическому обновлению
      buttonRefresh: TToolButton;

      trainList: TStringList;     // перечень уникальных номеров составов

      selectOperList: TStringList;  // список отмеченных операций
//      LockInfo: string;
   end;

// матрица разрешений для перемещения вагонов в зависимости от типа доступности
// 'МНВР'; 'ВГР'; 'ПГР'; 'СДВ'; 'МНВР';
const allowReposition: Array[0..3, 0..4] of Integer = ((0,0,0,0,0),  // 0 вагон не доступен
                                                       (1,1,1,1,1),  // 1 вагон доступен для маневровки
                                                       (1,1,1,1,1),  // 2 вагон доступен для выгрузки
                                                       (1,1,1,1,1)   // 3 вагон доступен для погрузки
                                                       );
// 20151214 смена схемы контроля
//const allowReposition: Array[0..3, 0..4] of Integer = ((0,0,0,0,0),  // 0 вагон не доступен
//                                                       (1,0,0,0,1),  // 1 вагон доступен для маневровки
//                                                       (1,1,0,1,1),  // 2 вагон доступен для выгрузки
//                                                       (1,0,1,1,1)   // 3 вагон доступен для погрузки
//                                                       );


// матрица разрешенных операций в зависимости от типа доступности вагона
const allowOper: Array[0..3] of String = ( '',                 // 0 вагон не доступен
                                           '2900001;2900005;2900003',  // 1 вагон доступен для маневровки ()
                                           '2900001;2900002',  // 2 вагон доступен для выгрузки (2900002)
                                           '2900001;2900003'   // 3 вагон доступен для погрузки (2900003)
                                           );
// 20151214 смена схемы контроля
// матрица разрешенных операций в зависимости от типа доступности вагона
//const allowOper: Array[0..3] of String = ( '',                 // 0 вагон не доступен
//                                           '2900001;2900005',  // 1 вагон доступен для маневровки ()
//                                           '2900001;2900002',  // 2 вагон доступен для выгрузки (2900002)
//                                           '2900001;2900003'   // 3 вагон доступен для погрузки (2900003)
//                                           );

// режимы работы буфера
const bufferMode: Array[0..6] of String = (
                                          'ПРОИЗВОЛЬНЫЙ',
                                          'ЗАЯВЛЕННЫЕ НА ВЫВОД',
                                          'ПОД ПОГРУЗКОЙ',
                                          'ПОД ВЫГРУЗКОЙ',
                                          'ВРЕМЕННО ВЫВЕДЕННЫЕ',
                                          'ДОСТУПЕН ДЛЯ ВЫГРУЗКИ',
                                          'ДОСТУПЕН ДЛЯ ПОГРУЗКИ'
                                           );

type TRollback = record
     step:       integer;    // шаг (может содержать несколько однотипных операций)
     op:         TOperation; // тип операции
     placeFrom:  integer;    // id места "откуда"
     placeTo:    integer;    // id места "куда"
     placeFromW: integer;    // id соотв. окна
     placeToW:   integer;    // id соотв. окна
     hashPlaceFrom: string;  // хеши цепочки "откуда" в формате before:post до и после выполнения операции
     hashPlaceTo:   string;  // хеши цепочки   "куда" в формате before:post до и после выполнения операции
     rollback:   string;     // набор команд для отмены шага (перации)
  end;

const statusSet: array[0..17] of TStatus = (
                                (color: $00000000; group: 0; shape: Diamond; name:'вагон недоступен'),
                                (color: $000000FF; group: 0; shape: Diamond; name:'вагон доступен для маневровки'),
                                (color: $0000FF00; group: 0; shape: Diamond; name:'вагон доступен для выгрузки'),
                                (color: $00FF0000; group: 0; shape: Diamond; name:'вагон доступен для погрузки'),

                                (color: $00AABB22; group: 1; shape: Square; name:'неподтвержденные'),

                                (color: $00F00000; group: 2; shape: Circle; name:'собственные вагоны'),
                                (color: $0000F0F0; group: 2; shape: Circle; name:'арендованные'),
                                (color: $000000F0; group: 2; shape: Circle; name:'вагоны субклиентов'),
                                (color: $00F000F0; group: 2; shape: Circle; name:'вагоны только что добавленные'),
                                (color: $00F0F000; group: 2; shape: Circle; name:'Разметка не Россия'),

                                (color: $000000FF; group: 3; shape: Triangle;  name:'временно выведен'),
                                (color: $000000FF; group: 1; shape: Square;    name:'заявленные на вывод'),

                                (color: $00000000; group: 0; shape: Diamond0;  name:'недоступен (есть операции в будущем)'),

                                (color: $000000FF; group: 4; shape: Diamond0;  name:'незакрытая заявка'),
                                (color: $000000FF; group: 4; shape: Square0;   name:'qwe'),
                                (color: $000000FF; group: 4; shape: Circle0;   name:'qwe'),
                                (color: $000000FF; group: 4; shape: Cross;     name:'qwe'),
                                (color: $00FF00FF; group: 4; shape: Plus;      name:'qwe')
                                 );

var rollBack: array of TRollback;
    rollBackStep: integer;

const reasonSet: array[0..6] of String = (
    'Погрузка',
    'Выгрузка',
    'Отстой',
    'Субклиенту',
    'Склад на колесах',
    'Оборудование вагона',
    'Использование как местный парк');


implementation

{$R *.dfm}

uses udbUtils, uVarUtils,iunsi, fuDefineAlgoritm, DateUtils, uMessages, uPeriod, uDateUtils, iurwsystem, iuRWReports,
     uStrUtils, fuRwWagonOperationCardForRazgruz, fuBaseForm, Registry, iunsirw, uTask, iuTaskSrv, iuRwinnerClime, ComObj, Excel2000,
     ExportToExcel, OleServer, fuSelectVariant, uLockObject;

var placeAbility: array[1..3] of TPlaceDescription;

//=================================================================================================
function TfmRwWagonDislocationEx.get_frPlace(aPlaceNo:Integer): TfrSDIBrowse;
begin
  result := nil;
  if aPlaceNo=1 then result := frPlace_1;
  if aPlaceNo=2 then result := frPlace_2;
  if aPlaceNo=3 then result := frPlace_3;
  if aPlaceNo=BUFFER_PLACE then result := frSelectedList_2;
end;

//=================================================================================================
function TfmRwWagonDislocationEx.getHash(placeID: integer = 0; timePoint: TDateTime = 0; operID: integer = 0): string;

  function getPlaceNo(placeID: integer): integer;
  var i: integer;
  begin
    result := 0;
    for i := 1 to 3 do begin
      if placeAbility[i].L_PLACE_STR_ID = placeID then result := i;
    end;
  end;

begin
  result := 'FF';
  if (F_PLACEMENT_CONTROL = 0) and (PlaceID > 0) then begin // отключен контроль хеша
     // проверим время внешних изменений на точке
     sqlGetDateTimeChange.ParamByName('P_PLACE_ID').AsInteger := PlaceID;
     sqlGetDateTimeChange.Execute;
     if placeAbility[getPlaceNo(placeID)].DateTimeChange = sqlGetDateTimeChange.ParamByName('P_DATE_CHANGE').AsDateTime then begin
       placeAbility[getPlaceNo(placeID)].hash := result;
       exit;  // изменений не было
     end;
     placeAbility[getPlaceNo(placeID)].DateTimeChange := sqlGetDateTimeChange.ParamByName('P_DATE_CHANGE').AsDateTime
  end;

  sqlGetHash.ParamByName('P_PLACE_ID').AsInteger := placeID;
  sqlGetHash.ParamByName('P_TIMEPOINT').AsDateTime := timePoint;
  sqlGetHash.ParamByName('P_RW_WAGON_OPER_ID').AsInteger := operID;
  sqlGetHash.Execute;
  result := sqlGetHash.ParamByName('P_RESULT').AsString;
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.rollbackProcess(op: TOperation;
  placeFrom: integer = 0;  placeTo: integer = 0;
  placeFromW: integer = 0; placeToW: integer = 0;
  hashPlaceFrom: string = '';  hashPlaceTo: string = '';  rb: string = '');

//=================================================================================================
function makeRollBack(rb: TRollback): boolean;
var hash_sour_before, hash_sour_after,
    hash_dest_before, hash_dest_after: string;
    i: integer;
begin
   result := false;
   // вычисляем текущие хеши точек перед откатом:
   hash_sour_before := getHash(rb.placeFrom, now());
   hash_dest_before := hash_sour_before;
   if rb.placeTo <> rb.placeFrom then
      hash_dest_before := getHash(rb.placeTo, now());

   // берем хеши точек после выполняения операции:
   hash_sour_after := uStrUtils.ExtractWord(2, rb.hashPlaceFrom, [':']);
   hash_dest_after := uStrUtils.ExtractWord(2, rb.hashPlaceTo,   [':']);

   if (hash_sour_after <> hash_sour_before) or (hash_dest_after <> hash_dest_before) then
      exit;

   if rb.op = internalRePosition then
      for i := uStrUtils.WordCount(rb.rollback, [';']) downto 1 do
          BrowseRefParams.Session.ExecSQL(uStrUtils.ExtractWord(i, rb.rollback, [';']),[]);

   if rb.op = externalRePosition then
      BrowseRefParams.Session.ExecSQL('declare v_err varchar2(999); v_res number; ' +
                   'begin v_res := RAILWAY_LOCATION_PKG.f_Wagon_Operation_Delete(' +
                   rb.rollback + ', true, v_err); end;',  []);

   // вычисляем хеши точек после отката:
   hash_sour_after := getHash(rb.placeFrom, now());
   hash_dest_after := hash_sour_after;
   if rb.placeTo <> rb.placeFrom then
      hash_dest_after := getHash(rb.placeTo, now());

   // берем хеши точек до выполняения операции:
   hash_sour_before := uStrUtils.ExtractWord(1, rb.hashPlaceFrom, [':']);
   hash_dest_before := uStrUtils.ExtractWord(1, rb.hashPlaceTo,   [':']);

   if (hash_sour_after <> hash_sour_before) or (hash_dest_after <> hash_dest_before) then
      exit;

   BrowseRefParams.Session.Commit;

   placeAbility[rb.placeFromW].freshRepositionListID := '';
   placeAbility[rb.placeToW].freshRepositionListID := '';

   UpdateQuery_Place(rb.placeFromW);
   get_frPlace(rb.placeFromW).dgrBrowse.MSelectedRows.Clear();

   if rb.placeToW <> rb.placeFromW then begin
      UpdateQuery_Place(rb.placeToW);
      get_frPlace(rb.placeToW).dgrBrowse.MSelectedRows.Clear();
   end;
   result := true;
end;

//=================================================================================================
function removeStep(step: integer): boolean;
  var loc_rollBack: array of TRollback;
      i: integer;
      rb_result: boolean;
begin
   result := false;

   rb_result := false;
   // откатываем операции в обратном порядке
   for i := Length(rollBack)-1 downto 0 do begin
      if rollBack[i].step <> step then continue;
      rb_result := makeRollBack(rollBack[i]);
      if not rb_result then exit;
   end;
   if not rb_result then exit;

   // переписываем в правильном порядке выполненные операции во временный массив
   for i := 0 to Length(rollBack)-1 do begin
      if rollBack[i].step = step then continue;
      SetLength(loc_rollBack, i + 1);
      loc_rollBack[i] := rollBack[i];
   end;

   SetLength(rollBack, 0);
   // восстанавливаем массив роллбэка, но уже без откаченных операций
   for i := 0 to Length(loc_rollBack)-1 do begin
      SetLength(rollBack, i + 1);
      rollBack[i] := loc_rollBack[i];
   end;
   result := true;
end;

var i, sz: integer;
begin
  if op = nextStep then begin
     rollBackStep := rollBackStep + 1;
     exit;
  end;

  if op = backStep then begin
     rollBackStep := rollBackStep - 1;
     if rollBackStep >= 0 then begin
        if removeStep(rollBackStep) then begin
           if rollBackStep = 0 then rollBackStep := -1;
        end else begin
           uMessages.Error('Состояние расположения было изменено из вне. Отмена операций невозможна');
           rollBackStep := -1;
           SetLength(rollBack, 0);
        end;
     end;
  end;

  if op in [internalRePosition, externalRePosition] then begin
    if rollBackStep < 0 then rollBackStep := 0;

    sz := Length(rollBack);
    SetLength(rollBack, sz + 1);

    rollBack[sz].step       := rollBackStep;
    rollBack[sz].op         := op;
    rollBack[sz].placeFrom  := placeFrom;
    rollBack[sz].placeTo    := placeTo;
    rollBack[sz].placeFromW := placeFromW;
    rollBack[sz].placeToW   := placeToW;
    rollBack[sz].hashPlaceFrom := hashPlaceFrom;
    rollBack[sz].hashPlaceTo   := hashPlaceTo;
    rollBack[sz].rollback   := rb;
  end;
  btRollback.Enabled := (rollBackStep >= 0);
//  showRB;
//  mStack.Clear;
  mStack.Lines.Add('==========');
  for i := 0 to Length(rollBack)-1 do mStack.Lines.Add(IntToStr(rollBack[i].step));
end;

//=================================================================================================
procedure RwWagonDislocationEx(AParams: TBrowseRefParams);
var i: integer;
begin

 // uMessages.Information('Принято решение о закрытии данного интерфейса на новогодние праздники. Если данный интерфейс необходим попросите администраторов восстановить предыдущий rwsystem.dll');
 // exit;

  rollBackStep := -1;

  try
    with TfmRwWagonDislocationEx.Create(nil) do
    try
      LSession := aParams.Session ;
      LoadParams(AParams);

      iuNSI.getACL(aParams.session);
      AParams.SDIResult:= ShowModal;

    finally
        SaveToIniFileParams();
        sqlDeleteRwDislocationCurrentUsers.Execute;
        quSelectRwWagonList.Close;

        for i := 1 to 3 do begin
           if not PlaceIsLocked(i) then continue;
           sqlLockClear.ParamByName('P_PLACE_ID').AsInteger := placeAbility[i].L_PLACE_STR_ID;
           sqlLockClear.Execute;
        end;

        Free;
    end;
  except
    on E:Exception do
    begin
      uMessages.Error('Ошибка при создании окна выбора записи!' + CRLF +                      E.Message);
    end;

  //
  end;

end;


function TfmRwWagonDislocationEx.GetSetupDateTime: TDateTime;
begin
  Result:= GetDataTime(dtpDate_In.Date, dtpTime_In.Time);
end;

function TfmRwWagonDislocationEx.GetDataTime(const aDate: TDate; const aTime: TTime): TDateTime;
var
  Hour, Min, Sec, MSec, AYear, AMonth, ADay: Word;
begin
   DecodeDate(aDate, AYear, AMonth, ADay);
   DecodeTime(aTime, Hour, Min, Sec, MSec);
   Result:= EncodeDateTime(AYear, AMonth, ADay, Hour, Min, 0, 0);
end;

procedure TfmRwWagonDislocationEx.LoadParams(AParams: TBrowseRefParams);
{ обработка параметров, переданных в процедуру }
//var lvModeItem: TModeItem;
  var i,j: integer;

procedure inflatePickList(PickList: TStrings);
begin
  PickList.Clear;
  iunsi.getDataA(AParams,'Select * from service s where s.end_date is null and s.date_end is null and s.service_type_id = 1495',[]);
  if AParams.SDIResult=mrOk then begin
    AParams.DataSet.First;
    while not AParams.DataSet.Eof do begin
      PickList.Add(AParams.DataSet['name']);
      AParams.DataSet.Next;
    end;
    AParams.DataSet.Close;
  end;
end;

begin

  for i := 1 to 3 do begin
      placeAbility[i].frPlace := TfrSDIBrowse.Create(nil);
      placeAbility[i].buttonRefresh := TToolButton.Create(nil);
      placeAbility[i].DateTimeChange := 0;

      placeAbility[i].frPlace.dgrBrowse := TMalDBGrid.Create(placeAbility[i].frPlace);
      placeAbility[i].frPlace.pmBrowse := TMalPopupMenu.Create(placeAbility[i].frPlace);


     case i of
       1: begin
            placeAbility[i].quPlace := quPlace_1;
            placeAbility[i].frPlace := frPlace_1;
            placeAbility[i].buttonRefresh := frPlace_1.ToolButton11;
            placeAbility[i].frPlace.dgrBrowse := frPlace_1.dgrBrowse;
//            placeAbility[i].frPlace.dgrBrowse.Parent := frPlace_1.dgrBrowse.Parent;
            placeAbility[i].lblSelected := laSelected_1;
            placeAbility[i].lblPlace := laPlace_1;
            placeAbility[i].lblPlaceStr := laPlaceStr_1;
            placeAbility[i].lblOperation_MODE := laOperation_MODE_1;
            placeAbility[i].imLegend := Legend_1;
            placeAbility[i].cbTempOutput := cbTempOutput_1;
            placeAbility[i].frPlace.pmBrowse := pmBrowseState_1;
            placeAbility[i].frPlace.pmBrowsePopup(pmBrowseState_1);
          end;
       2: begin
            placeAbility[i].quPlace := quPlace_2;
            placeAbility[i].frPlace := frPlace_2;
            placeAbility[i].buttonRefresh := frPlace_2.ToolButton11;
            placeAbility[i].frPlace.dgrBrowse := frPlace_2.dgrBrowse;
//            placeAbility[i].frPlace.dgrBrowse.Parent := frPlace_2.dgrBrowse.Parent;
            placeAbility[i].lblSelected := laSelected_2;
            placeAbility[i].lblPlace := laPlace_2;
            placeAbility[i].lblPlaceStr := laPlaceStr_2;
            placeAbility[i].lblOperation_MODE := laOperation_MODE_2;
            placeAbility[i].imLegend := Legend_1;
            placeAbility[i].cbTempOutput := cbTempOutput_2;
            placeAbility[i].frPlace.pmBrowse := pmBrowseState_2;
            placeAbility[i].frPlace.pmBrowsePopup(pmBrowseState_2);
          end;
       3: begin
            placeAbility[i].quPlace := quPlace_3;
            placeAbility[i].frPlace := frPlace_3;
            placeAbility[i].buttonRefresh := frPlace_3.ToolButton11;
            placeAbility[i].frPlace.dgrBrowse := frPlace_3.dgrBrowse;
//            placeAbility[i].frPlace.dgrBrowse.Parent := frPlace_3.dgrBrowse.Parent;
            placeAbility[i].lblSelected := laSelected_3;
            placeAbility[i].lblPlace := laPlace_3;
            placeAbility[i].lblPlaceStr := laPlaceStr_3;
            placeAbility[i].lblOperation_MODE := laOperation_MODE_3;
            placeAbility[i].imLegend := Legend_1;
            placeAbility[i].cbTempOutput := cbTempOutput_3;
            placeAbility[i].frPlace.pmBrowse := pmBrowseState_3;
            placeAbility[i].frPlace.pmBrowsePopup(pmBrowseState_3);
          end;
     end;
     placeAbility[i].frPlace.pmBrowsePopup(placeAbility[i].frPlace.dgrBrowse);

     for j := 0 to placeAbility[i].frPlace.dgrBrowse.Columns.Count - 1 do begin
       if UpperCase(placeAbility[i].frPlace.dgrBrowse.Columns[j].FieldName) <> 'ADD_DISLOCATION_NOTE' then
         continue;
       inflatePickList(placeAbility[i].frPlace.dgrBrowse.Columns[j].PickList);
       break;
     end;
  end;

  wasShowOperation := false;

  Loc_ResortModeEnabled := 0;
  ResortMode.Caption := 'Режим автоматической пересортировки ВЫКЛ';

  Glo_Order_BY_Cursor :=0 ;

  F_FULL_REOPEN      := 1;
  F_LIMIT_UNI_PLACES := 0;

  LOC_FOR_SHPT_PLACE_ID :=0;
  laForSHptSign.Caption := '';

  LOC_LOCOMOTIVE_SID := 0;
  laLocomotiveName.Caption := '';

  dtpDate_In.Date  := Now();
  dtpTime_In.Time  := 0;

  Lsession.ExecSQL('begin RAILWAY_LOCATION_PKG.setOperationMode(2); end;',[]);  // !!!!!!!!!!!!

  BrowseRefParams.Session     := Lsession;
  pkRailway_System.session    := Lsession;
  sqlInsertIntoTmpID.Session  := Lsession;
  sqlSetColor.Session         := Lsession;
  sqlUniquePlaces.Session     := Lsession;
  quWagonState.Session        := Lsession;

  sqlLockSet.Session          := Lsession;
  sqlLockClear.Session        := Lsession;
  sqlLockCheck.Session        := Lsession;

  frRwWagonOperationShow.quRwWagonOperation.Session  := Lsession;
  frRwWagonOperationShow.OnAfterUpdateActionStatus   := frRwWagonOperationShow.AfterUpdateWagonOperActionStatus;

  frBrowseRwWagonList.DataSet     := quSelectRwWagonList;
  frBrowseRwWagonList.OnAfterUpdateActionStatus := AfterUpdateWagonListActionStatus;

//!!sw  frSelectedList.DataSet := quSelectedWagon;
  frSelectedList.CardClass := TfmBaseSDICardForm;

//!!sw  frSelectedList_2.DataSet := quSelectedWagon;
  frSelectedList_2.CardClass := TfmBaseSDICardForm;

  gsm_RwWagonList.Session := Lsession as TMalOraSession;
  gsm_RwWagonList.SetDefaultMode();

  gsmPlaceState.Session := Lsession as TMalOraSession;

  F_Permit_Admin   := iuNSI.HasRole(BrowseRefParams, 'A_GDC_PERMIT_ADMIN');

  sqlDeleteTmpID.Execute;
  sqlDeleteTmpID_Date.Execute;

  LoadIniParams();

  InitLocalFrames;
  showAllPoints;

  F_IDLE_ALGORITM := DefineAlgoritm(BrowseRefParams);

  quWagonState.Open;
  L_State_ID := -1;
  cbxWagonStatus.KeyValue := -1;

  if F_LIGHT_DISLOC_MODE<>0 then
     cbLightShow.Checked := true
  else
     cbLightShow.Checked := False;

    if cbLightShow.Checked=True then
       Panel13.Visible := False
    else
       Panel13.Visible := True;
{ !!!!!!!!!!!!!!
  if F_ALLOW_CHANGE_SORT=True then
     begin
       If uMessages.QuestionYes('Открыть программу в режиме только для просмотра данных') = True then
          F_ALLOW_CHANGE_SORT:=False;
     end;
}
//F_ALLOW_CHANGE_SORT:=true; // !!!!!!!!!!!!
//    ALLOW_CHANGE_SORT_1 := true;
//    ALLOW_CHANGE_SORT_2 := true;
//    ALLOW_CHANGE_SORT_3 := true;

  // из профайла надо взять ID сортировки
  Loc_Place_ID := DEF_GDC_SORT_CODE;
  iunsi.getDataA(BrowseRefParams,'Select s.* from shpt_place s where s.end_date is null and s.shpt_place=:P_ID',[DEF_GDC_SORT_CODE]);
  if BrowseRefParams.SDIResult=mrOk then
     Loc_Place_ID := VarToInt(BrowseRefParams.DataSet['Shpt_place_ID'],0);

 // участок работы по умолчанию - ЖДЦ
  Loc_Gdc_Place_ID := 0;
  iunsi.getDataA(BrowseRefParams,'Select s.* from shpt_place s where s.end_date is null and s.shpt_place=:P_ID',[Def_GDC_CODE]);
  if BrowseRefParams.SDIResult=mrOk then
     Loc_Gdc_Place_ID := VarToInt(BrowseRefParams.DataSet['Shpt_place_ID'],0);

  // инициализация режимов работы буфера
  cbBufferMode.Items.Clear;
  for i := 0 to Length(bufferMode)-1 do
      cbBufferMode.Items.Add(bufferMode[i]);
  cbBufferMode.Text := cbBufferMode.Items.Strings[0];
  flowBufferMode := cbBufferMode.Text;

//  cbBufferAsFilter.Checked := true;
//  Clear_L_Move_From();

end;

procedure TfmRwWagonDislocationEx.InitLocalFrames();
begin

  frPlace_1.DataSet   := quPlace_1;
  frPlace_1.CardClass := TfmBaseSDICardForm;
  If F_Permit_Admin=True then
     frPlace_1.BrowseOptionSet := [boEdit,boDelete]
  else
     frPlace_1.BrowseOptionSet := [boEdit];
  frPlace_1.MultiSelect := True;

  frPlace_2.DataSet   := quPlace_2;
  frPlace_2.CardClass := TfmBaseSDICardForm;
  If F_Permit_Admin=True then
     frPlace_2.BrowseOptionSet := [boEdit,boDelete]
  else
     frPlace_2.BrowseOptionSet := [boEdit];
  frPlace_2.MultiSelect := True;

  frPlace_3.DataSet   := quPlace_3;
  frPlace_3.CardClass := TfmBaseSDICardForm;
  If F_Permit_Admin=True then
     frPlace_3.BrowseOptionSet := [boEdit,boDelete]
  else
     frPlace_3.BrowseOptionSet := [boEdit];
  frPlace_3.MultiSelect := True;

  frShptPlaces.DataSet := quSelectPlaces;
  frShptPlaces.BrowseOptionSet := [];

  frSelectedList_2.DataSet   := quPlace_4;
  frSelectedList_2.CardClass := TfmBaseSDICardForm;
  frSelectedList_2.BrowseOptionSet := [boEdit,boDelete];
  frSelectedList_2.MultiSelect := True;

end;

procedure TfmRwWagonDislocationEx.FormShow(Sender: TObject);
begin
  inherited;
  ///////

   laRecordFound.Caption := '';

    laWagonAction.Caption := '';
    laCargoGroup.Caption  := '';

    laSelected_WS.Caption  := '';
    laSelected_WS_2.Caption := '';
    laRWNAME.Caption       := '';

    btMoveToExternalPlace.Enabled := False;
    btMoveToExternalPlace.Visible := False;

    frSelectedList.AllowIncSearch := True;
    frSelectedList.MultiSelect := True;

    frSelectedList_2.AllowIncSearch := True;
    frSelectedList_2.MultiSelect := True;

    frBrowseRwWagonList.MultiSelect := True;
    frBrowseRwWagonList.AllowIncSearch := True;

    F_FULL_REOPEN := 0;

    // если нет прав на корректировку сортировок, то сразу показываем данные по дислокации
    pcMain.ActivePageIndex := 0;

    if pcMain.ActivePageIndex=1 then
       begin
         Label9.Visible :=False;
         laRecordFound.Visible :=False;
         edSearhWagonNo.Visible :=False;
         btSearhByWagonNo.Visible :=False;
         cbxSearhByWagonNo.Visible :=False;
         rgInsertMode.Visible:=False;
         cbShowWaitingForUShpt.Enabled := False;
         cbShowWaitingForUShpt.Visible := False;
         btRecallData.Visible := True;
         btRecallData.Enabled := True;
       end
    else
      begin
         Label9.Visible :=True;
         laRecordFound.Visible :=True;
         edSearhWagonNo.Visible :=True;
         btSearhByWagonNo.Visible :=True;
         cbxSearhByWagonNo.Visible :=True;
         rgInsertMode.Visible:=True;
         cbShowWaitingForUShpt.Visible := True;
         cbShowWaitingForUShpt.Enabled := True;
         btRecallData.Enabled := False;
         btRecallData.Visible := False;
      end;

    UpdateAll_QueryPlaces();

end;

procedure TfmRwWagonDislocationEx.UpdateQueryDislocationPlaces();
begin
    if pcMain.ActivePageIndex=0 then Exit;

    quSelectPlaces.Close;

    if cbLightShow.Checked=True then Exit;

    if cbShowByAllPlaceStr.Checked=True then
       quSelectPlaces.ParamByName('P_MODE').AsInteger  := 2
    else
       quSelectPlaces.ParamByName('P_MODE').AsInteger  := 1;

    if rgOperationMode.ItemIndex=0 then
       begin
         quSelectPlaces.MacroByName('m_Filter_1').Value  := 'and 1=1';
         quSelectPlaces.MacroByName('m_Filter_2').Value  := 'and 1=1';
         quSelectPlaces.MacroByName('m_Filter_Ushpt').Value := 'and 1=1';
       end;

    if rgOperationMode.ItemIndex=1 then
       begin
         quSelectPlaces.MacroByName('m_Filter_1').Value  := 'and (sp.workshop_id is null or st.F_OPERATION in (0,4))';
         quSelectPlaces.MacroByName('m_Filter_2').Value  := 'and sp.rw_subclient_id is null ';
         quSelectPlaces.MacroByName('m_Filter_Ushpt').Value := 'and 1=1';
       end;

    if rgOperationMode.ItemIndex=2 then
       begin
         quSelectPlaces.MacroByName('m_Filter_1').Value := 'and 1=1';
         quSelectPlaces.MacroByName('m_Filter_2').Value := 'and ( sp.rw_subclient_id is null or ( sp.rw_subclient_id is NOT null and sp.workshop_id is NOT null) )';
         quSelectPlaces.MacroByName('m_Filter_Ushpt').Value := 'and ( sp.workshop_id is NOT null and st.F_OPERATION in (1,3) )';
       end;

    if rgOperationMode.ItemIndex=3 then
       begin
         quSelectPlaces.MacroByName('m_Filter_1').Value := 'and 1=1';
         quSelectPlaces.MacroByName('m_Filter_2').Value := 'and sp.rw_subclient_id is null';
         quSelectPlaces.MacroByName('m_Filter_Ushpt').Value := 'and ( sp.workshop_id is NOT null and st.F_OPERATION in (2,3) )';
       end;

    if rgOperationMode.ItemIndex=4 then
       begin
         quSelectPlaces.MacroByName('m_Filter_1').Value := 'and 1=1';
         quSelectPlaces.MacroByName('m_Filter_2').Value := 'and ( sp.rw_subclient_id is NOT null )';
         quSelectPlaces.MacroByName('m_Filter_Ushpt').Value := 'and 1=1';
       end;

    if cbWagonExistOnly.Checked then
       quSelectPlaces.MacroByName('m_ShowOnly_Wagons').Value := 'and (Nvl(yy.wagon_Count,0)>0 or yy.PLACE_STR_ID=-1) '
    else
       quSelectPlaces.MacroByName('m_ShowOnly_Wagons').Value := 'and 1=1';

    if F_LIMIT_UNI_PLACES=1 then
       begin
         if cbShowByAllPlaceStr.Checked=True then
            quSelectPlaces.MacroByName('m_Filter_Place_ID').Value := 'and ( yy.place_id in (Select ID2 from tmp_ID_NAME) or yy.place_id = -1 )'
         else
            quSelectPlaces.MacroByName('m_Filter_Place_ID').Value := 'and ( yy.shpt_place_str_id in (Select ID1 from tmp_ID_NAME) or yy.shpt_place_str_id = -1 )';
       end
    else
       begin
         if cbShowByAllPlaceStr.Checked=True then
            quSelectPlaces.MacroByName('m_Filter_Place_ID').Value := 'and ( yy.place_id in (Select ID2 from TMP_ID4) or yy.place_id = -1 )'
         else
            quSelectPlaces.MacroByName('m_Filter_Place_ID').Value := 'and ( yy.shpt_place_str_id in (Select ID1 from TMP_ID4) or yy.shpt_place_str_id = -1 )';
       end;

    quSelectPlaces.Open;

    If pcMain.ActivePageIndex=1 then
       if frShptPlaces.dsBrowse.DataSet.RecordCount<>0 then
          begin
            if F_FULL_REOPEN=1 then
               begin
                 F_FULL_REOPEN:=0;
                 F_UPdateMode := 1;
               end;
            frShptPlaces.dsBrowse.DataSet.First;
          end;

end;

procedure TfmRwWagonDislocationEx.Update_Local_QueryPlaces();
var i: integer;
begin
    if pcMain.ActivePageIndex=1 then Exit;
    for i := 1 to 3 do UpdateQuery_Place(i);
end;

procedure TfmRwWagonDislocationEx.UpdateAll_QueryPlaces();
begin
    F_FuLL_REOPEN := 1;
    UpdateQueryDislocationPlaces();
    Update_Local_QueryPlaces();
    F_FuLL_REOPEN := 0;
end;

procedure TfmRwWagonDislocationEx.UpdateQuery_Place(aPlaceNo:Integer);
var
  l_PLACE_STR_ID : Integer;
  l_SAVE_ID    : Integer;
var frPlace: TfrSDIBrowse;
var quPlace: TMalOraQuery;
var str: string;
begin

//Set_Place_
  if placeAbility[aPlaceNo].L_PLACE_STR_ID = 0 then exit;

  sqlGetChain.ParamByName('P_NAME_CACHE').AsString   := 'DSL';
  sqlGetChain.ParamByName('P_GRID_NUMBER').AsInteger := aPlaceNo;
  sqlGetChain.ParamByName('P_TIME_POINT').AsDateTime := Now(); //GetDataTime(dtpDate_In.Date, dtpTime_In.Time);
  sqlGetChain.ParamByName('P_PLACE_ID').AsInteger    := placeAbility[aPlaceNo].L_PLACE_STR_ID;
  sqlGetChain.Execute;

  Loc_Place_Str_NO := GetPlaceStrID(aPlaceNo, Loc_Place_ID, Loc_Operation_MODE, l_PLACE_STR_ID);
  UpdateMain_Query_Place(Loc_Place_ID,Loc_Place_Str_NO,l_PLACE_STR_ID,aPlaceNo);

  laSelected_WS.Caption   := '';
  laSelected_WS_2.Caption := '';

  frPlace := get_frPlace(aPlaceNo);
  quPlace := placeAbility[aPlaceNo].quPlace;

  l_SAVE_ID := 0;
  if frPlace.dsBrowse.DataSet.RecordCount<>0 then
     l_SAVE_ID := VarToInt(frPlace.dsBrowse.DataSet['Rw_Wagon_List_ID'],0);

   quPlace.Close;
   if cbLightShow.Checked=True then begin
      quPlace.MacroByName('MainSql').Value := quSelectMainPlaceLight.FinalSQL;
      quPlace.Params := quSelectMainPlaceLight.Params;
   end else begin
      quPlace.MacroByName('MainSql').Value := quSelectMainPlace.FinalSQL;
      quPlace.Params := quSelectMainPlace.Params;
   end;
   quPlace.Open;

   frPlace.UpdateActionStatus;

   if L_SAVE_ID<>0 then
      frPlace.dsBrowse.DataSet.Locate('RW_WAGON_LIST_ID',L_SAVE_ID,[]);

  // настройка грида под соотв. операцию
  gsmPlaceState.Grid := frPlace.dgrBrowse;

  str := placeAbility[aPlaceNo].lblOperation_MODE.Caption;
  if not cbLightShow.Checked then str := str + '+';

  gsmPlaceState.Mode := str;

  placeAbility[aPlaceNo].timeRefresh := Now();
  // получим хеш после обновления на точке
  placeAbility[aPlaceNo].hash := getHash(placeAbility[aPlaceNo].L_PLACE_STR_ID, now());
end;

function trueOrder(dst: TMalDBGrid): boolean;
var i: integer;
begin
  result := false;
  for i := 0 to dst.Columns.Count - 1 do begin
    if dst.Columns[i].Title.SortIndex <> 0 then begin
       uMessages.Error('Для изменения порядка вагонов в составе отключите сортировку');
       exit;
    end;
  end;
  result := true;
end;

procedure restoreSelection(dst: TMalDBGrid; _listSelectedID: string; flowID: integer);
var flowRow: TBookmark;
var listSelectedID: string;
begin
    if _listSelectedID <> '' then
       dst.MSelectedRows.Clear();

    listSelectedID := ',' + _listSelectedID + ',';

    flowRow := nil;
    dst.DataSource.DataSet.first;
    while not dst.DataSource.DataSet.Eof do begin
       if pos(',' + VarToStr(dst.DataSource.Dataset['RW_WAGON_OPER_ID']) + ',', listSelectedID) > 0 then
          dst.MSelectedRows.SetCurrentRowSelected(true);

       if flowID = VarToInt(dst.DataSource.Dataset['RW_WAGON_OPER_ID'], 0) then
          flowRow := dst.DataSource.DataSet.GetBookmark;

       dst.DataSource.DataSet.Next;
    end;

    if flowRow <> nil then
       dst.DataSource.DataSet.GotoBookmark(flowRow);
end;

procedure TfmRwWagonDislocationEx.ArrowUpDownPressed(aPlaceNo:Integer; aMoveOrder: Integer);

 function getFlowOperID(aPlaceNo:Integer; aMoveOrder: Integer; var nextID: integer; var flowID: integer; var prevID: integer): TfrSDIBrowse;
   var frPlace: TfrSDIBrowse;
       flowRow: TBookmark;
       flowTrainNumber: integer;
 begin
    frPlace := get_frPlace(aPlaceNo);
    result := frPlace;

    nextID := -1; flowID := -1; prevID := -1;

    if frPlace.dsBrowse.DataSet.RecordCount=0 then   exit;
    if not trueOrder(frPlace.dgrBrowse) then exit;

    // отказ от перемещения активной записи, будем перемещать на первую отмеченную
    frPlace.dsBrowse.DataSet.First;
    while not frPlace.dsBrowse.DataSet.Eof do begin
       if frPlace.dgrBrowse.MSelectedRows.CurrentRowSelected then break;
       frPlace.dsBrowse.DataSet.Next;
    end;

    flowRow := frPlace.dsBrowse.DataSet.GetBookmark;

    flowID := VarToInt(frPlace.dsBrowse.DataSet['Rw_Wagon_oper_ID'],0);
    flowTrainNumber := VarToInt(frPlace.dsBrowse.DataSet['TRAIN_NUMBER'],0);

    frPlace.dsBrowse.DataSet.next;
    if not frPlace.dsBrowse.DataSet.Eof then
       if flowTrainNumber = VarToInt(frPlace.dsBrowse.DataSet['TRAIN_NUMBER'],0) then
          nextID := VarToInt(frPlace.dsBrowse.DataSet['Rw_Wagon_oper_ID'],0);

    frPlace.dsBrowse.DataSet.GotoBookmark(flowRow);

    frPlace.dsBrowse.DataSet.Prior;
    if not frPlace.dsBrowse.DataSet.Bof then begin
       if flowTrainNumber = VarToInt(frPlace.dsBrowse.DataSet['TRAIN_NUMBER'],0) then begin
          prevID := VarToInt(frPlace.dsBrowse.DataSet['Rw_Wagon_oper_ID'],0);
          frPlace.dsBrowse.DataSet.First;
          if prevID = VarToInt(frPlace.dsBrowse.DataSet['Rw_Wagon_oper_ID'],0) then
             prevID := -2;
       end;
    end;
    frPlace.dsBrowse.DataSet.GotoBookmark(flowRow);
 end;

var i, prevID, flowID, nextID: integer;
var res, listSelectedID: string;
var frPlace: TfrSDIBrowse;
var hash_sour_before, hash_sour_after: string;
begin

   //LockWindowUpdate(placeAbility[aPlaceNo].frPlace.dgrBrowse.Handle);
   LockWindowUpdate(placeAbility[aPlaceNo].frPlace.Handle);

   frPlace := getFlowOperID(aPlaceNo, aMoveOrder, nextID, flowID, prevID);

   if flowID < 0 then begin LockWindowUpdate(0); exit; end;

   listSelectedID := '';
   for i := 0 to frPlace.dgrBrowse.MSelectedRows.Count-1 do begin
       frPlace.dsBrowse.DataSet.GotoBookmark(pointer(frPlace.dgrBrowse.MSelectedRows.Items[i]));
       listSelectedID := listSelectedID + ',' + VarToStr(frPlace.dsBrowse.Dataset['RW_WAGON_OPER_ID']) + ',';
   end;

   if aMoveOrder = mvDown then begin
      sqlMoveUpDown.ParamByName('P_SOUR_OP_ID').AsInteger := flowID;
      sqlMoveUpDown.ParamByName('P_DEST_OP_ID').AsInteger := nextID
   end else begin
      if prevID = -2 then begin
         sqlMoveUpDown.ParamByName('P_SOUR_OP_ID').AsInteger := flowID;
         sqlMoveUpDown.ParamByName('P_DEST_OP_ID').AsInteger := prevID;
      end else begin
         sqlMoveUpDown.ParamByName('P_SOUR_OP_ID').AsInteger := prevID;
         sqlMoveUpDown.ParamByName('P_DEST_OP_ID').AsInteger := flowID;
      end;
   end;

   hash_sour_before := getHash(placeAbility[aPlaceNo].L_PLACE_STR_ID, now());
   sqlMoveUpDown.Execute;
   hash_sour_after  := getHash(placeAbility[aPlaceNo].L_PLACE_STR_ID, now());

   res := sqlMoveUpDown.ParamByName('P_RESULT').AsString;
   if res <> '' then begin
      UpdateQuery_Place(aPlaceNo);
      restoreSelection(frPlace.dgrBrowse, listSelectedID, flowID);

      rollbackProcess(internalRePosition,
             placeAbility[aPlaceNo].L_PLACE_STR_ID,placeAbility[aPlaceNo].L_PLACE_STR_ID,aPlaceNo,aPlaceNo,
             hash_sour_before + ':' + hash_sour_after,
             hash_sour_before + ':' + hash_sour_after,
             res
             );

      rollbackProcess(nextStep);
   end;

   LockWindowUpdate(0);
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.ReopenMainQuery();
begin

  F_UpdateMode := 0;

  frBrowseRwWagonList.dgrBrowse.MSelectedRows.Clear;

  quSelectRwWagonList.Close;

    // Перевести в настройки REGUSER
    quSelectRwWagonList.ParamByName('P_SHOW_TNS_MODE').AsInteger := F_SHOW_TNS_WGHT_ONLY;

    if VarToStr(cbxUniWagonOwner.KeyValue)<>'' then
       begin
          If VarToInt(cbxUniWagonOwner.KeyValue,0) >= 0 Then
             quSelectRwWagonList.MacroByName('SQLWagonOwner').Value:= ' and Nvl(dsl.Wagon_Owner_Firm_ID,0) = ' + VarToStr(cbxUniWagonOwner.KeyValue)
          else
             quSelectRwWagonList.MacroByName('SQLWagonOwner').Value:= '';
       end;

    quSelectRwWagonList.MacroByName('SQLSubClient').Value:= ' ';

    if rgOPerationMode.ItemIndex=4 then
       quSelectRwWagonList.MacroByName('SQLSubClient').Value:= ' and dsl.In_rw_subclient_id is NOT Null ';
    if cbShowAllWagons.Checked=True then
       quSelectRwWagonList.MacroByName('SQLSubClient').Value:= '';
    if rgOPerationMode.ItemIndex=0 then
       quSelectRwWagonList.MacroByName('SQLSubClient').Value:= '';
    If VarToInt(cbxUniSubclient.KeyValue,0) <> 0 Then
       quSelectRwWagonList.MacroByName('SQLSubClient').Value:= ' and dsl.In_rw_subclient_id = ' + VarToStr(cbxUniSubclient.KeyValue);

    if edWagonList.Text<>'' then
       begin
         quSelectRwWagonList.MacroByName('sqlFilterWagonList').Value:= 'and dsl.wagon_no in ' + '(' + edWagonList.Text + ')';
       end
    else
      begin
        quSelectRwWagonList.MacroByName('sqlFilterWagonList').Value := '';
      end;

  case rgType_Disloc.ItemIndex of    //
    0: quSelectRwWagonList.MacroByName('SqlAddFilter').Value := '';
    1: quSelectRwWagonList.MacroByName('SqlAddFilter').Value := 'and dsl.f_wagon_is_full=1';
    2: quSelectRwWagonList.MacroByName('SqlAddFilter').Value := 'and dsl.f_wagon_empty=1';
    3: quSelectRwWagonList.MacroByName('SqlAddFilter').Value := ' and ( dsl.in_rw_subclient_id is not null OR dsl.out_rw_subclient_id is not null )';
    4: quSelectRwWagonList.MacroByName('SqlAddFilter').Value := ' and ( dsl.in_rw_subclient_id is null and dsl.out_rw_subclient_id is null )';
  end;    // case

  If cbWagonsForExternalPlace.Checked=True then
     quSelectRwWagonList.MacroByName('SqlAddFilter').Value := sqlWagonIsEmpty.FinalSQL + ' ' + ' and dsl.READY_DATE is Null ' ;

  if Loc_WagonActionSID<>0 then
     quSelectRwWagonList.MacroByName('SqlWagonAction').Value := ' and dsl.f_rent_action_sid='+IntToStr(Loc_WagonActionSID)
  else
     quSelectRwWagonList.MacroByName('SqlWagonAction').Value := ' and 1=1 ';

  quSelectRwWagonList.ParamByName('P_PLACE_MODE').AsInteger   := 1;

  quSelectRwWagonList.MacroByName('m_OrderBy').Value := 'order by yy.last_Place_name, yy.local_order_in_train_head nulls last, yy.Wagon_Status_Name';

  if (cbShowAllWagons.Checked=True) or (quselectPlaces.RecordCount=0) or (F_FULL_REOPEN=1) then
     begin
       quSelectRwWagonList.MacroByName('SqlWagonsInPlace').Value := ' and 1=1 ';
       quSelectRwWagonList.ParamByName('P_PLACE_STR_ID').AsInteger := 0;
       quSelectRwWagonList.ParamByName('P_PLACE_ID').AsInteger     := 0;
       quSelectRwWagonList.ParamByName('P_PLACE_MODE').AsInteger   := 1;
     end
  else
     begin
        if cbShowByAllPlaceStr.Checked=True then
           begin
             quSelectRwWagonList.ParamByName('P_PLACE_MODE').AsInteger   := 2;
             quSelectRwWagonList.MacroByName('SqlWagonsInPlace').Value := ' and dsl.last_Main_Place_ID = :P_PLACE_ID';
             quSelectRwWagonList.ParamByName('P_PLACE_STR_ID').AsInteger := 0;
             quSelectRwWagonList.ParamByName('P_PLACE_ID').AsInteger := VarToInt(frShptPlaces.dsBrowse.DataSet['PLACE_ID'],0);
             //quSelectRwWagonList.MacroByName('m_OrderBy').Value := 'order by yy.last_Place_name, yy.local_order_in_train_head nulls last';
           end
        else
           begin
             quSelectRwWagonList.ParamByName('P_PLACE_MODE').AsInteger   := 1;
             quSelectRwWagonList.MacroByName('SqlWagonsInPlace').Value := ' and dsl.last_Place_ID = :P_PLACE_STR_ID ';
             quSelectRwWagonList.ParamByName('P_PLACE_STR_ID').AsInteger := VarToInt(frShptPlaces.dsBrowse.DataSet['PLACE_STR_ID'],0);
             quSelectRwWagonList.ParamByName('P_PLACE_ID').AsInteger := 0;
           end;
     end;

  quSelectRwWagonList.ParamByName('P_CargoGroupID').AsInteger := Loc_CargoGroupID;
  if Loc_CargoGroupID<>0 then
     quSelectRwWagonList.MacroByName('SqlCargoGroupFilter').Value := ' and ( (dsl.IN_Cargo_Grp_SID=:P_CargoGroupID) or (dsl.OUT_Cargo_Grp_SID=:P_CargoGroupID) )'
  else
     quSelectRwWagonList.MacroByName('SqlCargoGroupFilter').Value := ' and 1=1 ';

  if cbOnlyArrived.Checked=True then
     quSelectRwWagonList.MacroByName('SqlOnlyArrivedWagons').Value := ' and dsl.F_WAGON_ONLY_ARRIVED=1 '
  else
     quSelectRwWagonList.MacroByName('SqlOnlyArrivedWagons').Value := ' and 1=1 ';

  frBrowseRwWagonList.dgrBrowse.ColumnByFieldName['last_Place_name'].Visible    := True;
  if cbShowAllWagons.Checked=True then
     frBrowseRwWagonList.dgrBrowse.ColumnByFieldName['last_Place_name'].Visible   := True;
  if cbShowByAllPlaceStr.Checked=True then
     frBrowseRwWagonList.dgrBrowse.ColumnByFieldName['last_Place_name'].Visible   := True;

  quSelectRwWagonList.ParamByName('P_Wagon_Status_No').AsInteger := VarToInt(cbxWagonStatus.KeyValue);

   case rgwagonOwner.ItemIndex of
     0: quSelectRwWagonList.MacroByName('SqlWagonOwnerMode').Value := '';
     1: quSelectRwWagonList.MacroByName('SqlWagonOwnerMode').Value := ' and (dsl.f_rent=0 or dsl.f_agency_contract=1) ' ;
     2: quSelectRwWagonList.MacroByName('SqlWagonOwnerMode').Value := ' and dsl.f_rent=1 ' ;
     3: quSelectRwWagonList.MacroByName('SqlWagonOwnerMode').Value := ' and dsl.f_rent=0 ' ;
     4: quSelectRwWagonList.MacroByName('SqlWagonOwnerMode').Value := ' and dsl.f_agency_contract=1 ' ;
   end;

   if cbShptWithApprovalDate.Checked=True then
      quSelectRwWagonList.MacroByName('SqlFilterByApprovalDate').Value := ' and dsl.approval_date is NOT Null '
   else
      quSelectRwWagonList.MacroByName('SqlFilterByApprovalDate').Value := '';

   if cbCommerceError.Checked=True then
      quSelectRwWagonList.MacroByName('SqlFilterByCommerceError').Value := ' and dsl.F_COMMERCE_ERROR_Exist=1 '
   else
      quSelectRwWagonList.MacroByName('SqlFilterByCommerceError').Value := '';

  quSelectRwWagonList.MacroByName('m_distinct').Value:= 'distinct';
  if F_LIMIT_UNI_PLACES=1 then
     quSelectRwWagonList.MacroByName('m_distinct').Value:= ' ';
     
  if cbLightShow.Checked=False then
     begin
       quSelectRwWagonList.Open;
      // вычислить уникальные места
      if F_LIMIT_UNI_PLACES=1 then
         begin
           sqlGetFilteredPlaces.MacroByName('SqlMainQuery').Value := quSelectRwWagonList.FinalSQL;
           sqlGetFilteredPlaces.Params := quSelectRwWagonList.Params;
           sqlGetFilteredPlaces.Execute;
         end;
     end
  else
    quSelectPlaces.Close;

  F_UpdateMode := 1;

  frBrowseRwWagonList.UpdateActionStatus();
  if (Self.Visible) and (quSelectRwWagonList.RecordCount<>0) and (pcMain.ActivePageIndex=1) then
     frBrowseRwWagonList.dsBrowse.DataSet.First;

end;

procedure TfmRwWagonDislocationEx.UpdateMain_Query_Place(aPlace_ID:Integer; aPlace_Str_NO:Integer; aPlace_Str_ID:Integer; Loc_Grid_Number: integer);
begin

  quSelectMainPlace.Close;
  quSelectMainPlaceLight.Close;

  quSelectMainPlace.ParamByName('P_GRID_NUMBER').AsInteger := Loc_Grid_Number;
  quSelectMainPlaceLight.ParamByName('P_GRID_NUMBER').AsInteger := Loc_Grid_Number;

  quSelectMainPlace.ParamByName('P_Place_ID').AsInteger      := aPlace_Id;
  quSelectMainPlace.ParamByName('P_PLACE_STR_NO').AsInteger := aPlace_Str_NO;

  // Перевести в настройки REGUSER
  quSelectMainPlace.ParamByName('P_SHOW_TNS_MODE').AsInteger := F_SHOW_TNS_WGHT_ONLY;
  quSelectMainPlaceLight.ParamByName('P_SHOW_TNS_MODE').AsInteger := F_SHOW_TNS_WGHT_ONLY;

  if Rw_Str='' then
     begin
       quSelectMainPlace.MacroByName('sqlFilterRailWays').Value := ' Where 1=1 ';
       quSelectMainPlace.MacroByName('M_Railway_LIST').Value := '(1,999)';
       laRWNAME.Caption := '';
     end
  else
     begin
       quSelectMainPlace.MacroByName('sqlFilterRailWays').Value := ' where ( yyy.D_1<>0 or yyy.D_2<>0) ';
       quSelectMainPlace.MacroByName('M_Railway_LIST').Value := Rw_STR;
       laRWNAME.Caption := Rw_STR_NAME;
     end;

  case rgType_Places.ItemIndex of    //
    0: quSelectMainPlace.MacroByName('SqlAddFilter').Value := '';
    1: quSelectMainPlace.MacroByName('SqlAddFilter').Value := sqlWagonIsFull.FinalSQL;
    2: quSelectMainPlace.MacroByName('SqlAddFilter').Value := sqlWagonIsEmpty.FinalSQL;
    3: quSelectMainPlace.MacroByName('SqlAddFilter').Value := ' and wl.in_rw_subclient_id is not null ';
  end;    // case

  // фильтр по грузовым операциям
  case rgCargoOper.ItemIndex of    //
    0: quSelectMainPlace.MacroByName('SqlFilterByOutDate').Value := '';
    1: quSelectMainPlace.MacroByName('SqlFilterByOutDate').Value := ' and op.in_date is not null and op.end_date is null and op.out_date is null';
    2: quSelectMainPlace.MacroByName('SqlFilterByOutDate').Value := ' and op.begin_date is not null and op.end_date is not null';
    3: quSelectMainPlace.MacroByName('SqlFilterByOutDate').Value := ' and op.out_date is not null and op.fact_shpt_date is null ';
  end;

  quSelectMainPlace.MacroByName('SqlFilterToUshptMove').Value := ' and 1=1 ';
  if cbShowWaitingForUShpt.Checked = True then
     begin
       quSelectMainPlace.MacroByName('SqlFilterToUshptMove').Value := sqlWaitingToUshptMove.FinalSql;
     end;

   if cbLightShow.Checked=True then
      begin
        quSelectMainPlaceLight.MacroByName('SqlAddFilter').Value := quSelectMainPlace.MacroByName('SqlAddFilter').Value;
        quSelectMainPlaceLight.MacroByName('SqlFilterByOutDate').Value := quSelectMainPlace.MacroByName('SqlFilterByOutDate').Value;
        quSelectMainPlaceLight.MacroByName('SqlFilterToUshptMove').Value := quSelectMainPlace.MacroByName('SqlFilterToUshptMove').Value;
      end;

   quSelectMainPlaceLight.MacroByName('SqlBufferAsFilter').Value := '';
   if cbBufferAsFilter.Checked then
      quSelectMainPlaceLight.MacroByName('SqlBufferAsFilter').Value :=
      ' and not exists (Select 1 from tmp_cache_table ct00 where ct00.taskID = 7 and ct00.objID = op.rw_wagon_oper_id and ct00.var1 <> :P_GRID_NUMBER and :P_GRID_NUMBER < 4)';
end;


procedure TfmRwWagonDislocationEx.AfterUpdateWagonListActionStatus(
  Sender: TObject);
begin
   frBrowseRwWagonList.acDelete.Enabled   := False;
   frBrowseRwWagonList.acInsert.Enabled   := False;
   frBrowseRwWagonList.acEdit.Enabled     := False;
   frBrowseRwWagonList.acViewCard.Enabled := False;

   If not frBrowseRwWagonList.DataSet.IsEmpty then
      begin
       frBrowseRwWagonList.acEdit.Enabled     := True;
       frBrowseRwWagonList.acViewCard.Enabled := True;
      end;
end;

procedure TfmRwWagonDislocationEx.OneRightClick(Sender: TObject);
begin
  inherited;
    ReopenMainQuery();
    Update_Local_QueryPlaces();
end;

{
procedure  TfmRwWagonDislocationEx.AddListWagonAction(aRwWagonOperID: Integer; aAutoCommit: Integer);
var
  Loc_LastOrder        : Integer;
//  Loc_err              : Integer;
  Loc_Rw_Wagon_Oper_ID : Integer;
  Loc_Rw_Wagon_List_ID : Integer;
  Loc_Wagon_NO         : Integer;
//  Loc_WAGON_STATE      : Integer;
begin
  inherited;

       Loc_Rw_Wagon_Oper_ID := aRwWagonOperID;
       iunsi.GetDataA(BrowseRefParams,'Select Wagon_NO, rw_wagon_list_id from rw_wagon_list where rw_wagon_list_id='+
            '(select rw_wagon_list_id from rw_wagon_operation where rw_wagon_oper_id = :P_ID)',[ Loc_Rw_wagon_Oper_ID ]);

       if BrowseRefParams.SDIResult<>mrOK then exit;

       Loc_Wagon_NO := VarToInt(BrowseRefParams.DataSet['Wagon_NO'],0);
       Loc_Rw_Wagon_List_ID := VarToInt(BrowseRefParams.DataSet['rw_wagon_list_id'],0);

       quLastOrderInList.ParamByName('P_Operation_Type').Value := quSelectedWagon.ParamByName('P_Operation_Type').Value;
       uDBUtils.DatasetRefresh(quLastOrderInList, False);

  //     Loc_WAGON_STATE := 0;
    //   iunsi.getDataA(BrowseRefParams,'select ct.var2 as WAGON_STATE from tmp_cache_table ct where ct.taskID = 7 and ct.objID = :P_ID',[Loc_Rw_Wagon_Oper_ID]);
      // if BrowseRefParams.SDIResult=mrOk then
        //  Loc_WAGON_STATE := VarToInt(BrowseRefParams.Dataset['WAGON_STATE'],0);

       quSelectedWagon.Append();
       quSelectedWagon['RW_WAGON_OPER_ID'] := Loc_Rw_Wagon_Oper_ID;
       quSelectedWagon['RW_WAGON_LIST_ID'] := Loc_Rw_Wagon_List_ID;
       quSelectedWagon['WAGON_NO']         := Loc_Wagon_NO;
       quSelectedWagon['OPERATION_TYPE']   := quSelectedWagon.ParamByName('P_Operation_Type').Value;
       quSelectedWagon['WAGON_STATE']      := 0; //Loc_WAGON_STATE;

       Loc_LastOrder :=  VarToInt(quLastOrderInList['LastOrder']);
       quSelectedWagon['ORDER_IN_LIST']    := Loc_LastOrder+1;

       begin
          pkRailway_System.Params.Clear();
          pkRailWay_System.ExecProc('F_Get_Last_WagonOperation_Date',
          [
           VarToInt(quSelectedWagon['RW_WAGON_LIST_ID']),
           1
           ] );
         quSelectedWagon['LAST_DATE_OPERATION'] := pkRailWay_System.Params.ParamByName('RESULT').AsDate;

          pkRailway_System.Params.Clear();
          pkRailWay_System.ExecProc('F_Get_Last_WagonOperation_Date',
          [
           VarToInt(quSelectedWagon['RW_WAGON_LIST_ID']),
           2
           ] );
         quSelectedWagon['idle_arrival_date'] := pkRailWay_System.Params.ParamByName('RESULT').AsDate;

       end;

       if aAutoCommit=1 then
          quSelectedWagon.Post();

       frSelectedList.UpdateActionStatus();
       frSelectedList_2.UpdateActionStatus();

end;
}

//=================================================================================================
procedure addToString(var dst: string; add, separator: string);
begin
    if dst = '' then dst := add
    else dst := dst + separator + add;
end;


//=================================================================================================
procedure reOpenQuery(qry: TMalOraQuery);
begin
    if qry.Tag = BUFFER_PLACE then
       if qry.RecordCount = 0 then exit;

    qry.Close; qry.Open;
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.OneLeftClick(Sender: TObject);
var i: integer;
var listMovedWagon: string;
begin
  inherited;

  if frSelectedList_2.dgrBrowse.MSelectedRows.Count <= 0 then exit;

  listMovedWagon := '';
  for i := 0 to frSelectedList_2.dgrBrowse.MSelectedRows.Count - 1 do begin
      frSelectedList_2.DataSet.GotoBookmark(pointer(frSelectedList_2.dgrBrowse.MSelectedRows.Items[i]));
      addToString(listMovedWagon, VarToStr(frSelectedList_2.Dataset['RW_WAGON_OPER_ID']), ',');
  end;

  if listMovedWagon = '' then exit;

  BrowseRefParams.Session.ExecSQL('delete from tmp_cache_table where objID in (' + listMovedWagon +
         ') and var1 = ' + IntToStr(frSelectedList_2.tag),[]);
  BrowseRefParams.Session.Commit;

  frSelectedList_2.dgrBrowse.MSelectedRows.Clear();
  Update_Local_QueryPlaces();
  reOpenQuery(quPlace_4);

end;

procedure TfmRwWagonDislocationEx.CommonLeftClick(Sender: TObject);
begin
{
  inherited;
    quClearListWagon.ParamByName('P_Operation_Type').AsInteger := 99;
    quClearListWagon.Execute;
   if pcMain.ActivePageIndex=0 then
      begin
        frSelectedList_2.acRefreshExecute(Sender);
        Update_Local_QueryPlaces();
      end
   else
     frSelectedList.acRefreshExecute(Sender);
     }
end;

procedure TfmRwWagonDislocationEx.CommonRightClick(Sender: TObject);
//Var  I : Integer;
begin
  inherited;
{
 with frBrowseRwWagonList do
   if dgrBrowse.MSelectedRows.Count > 0 then
   begin
    DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[0]));

    for I := 0 to dgrBrowse.MSelectedRows.Count - 1 do
    begin
      DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));
      //AddListWagonAction( VarToInt(frBrowseRwWagonList.dsBrowse.Dataset['RW_WAGON_LIST_ID'],0), 0 );
      //AddListWagonAction( VarToInt(frBrowseRwWagonList.dsBrowse.Dataset['RW_WAGON_OPER_ID'],0), 0 );
    end;

    dgrBrowse.MSelectedRows.Clear();
   end;

//!!sw   quSelectedWagon.Post();

   ReopenMainQuery();
   Update_Local_QueryPlaces();
 }
end;

procedure TfmRwWagonDislocationEx.quSelectedWagonAfterOpen(
  DataSet: TDataSet);
Var
  I : Integer;
begin
  inherited;
  for i:= 0 to TMalOraQuery(DataSet).Fields.Count - 1 do
    begin
      if UpperCase(TMalOraQuery(DataSet).Fields[i].FieldName) = 'IDLE_ARRIVAL_DATE' then
         TTimeField(TMalOraQuery(DataSet).Fields[i]).DisplayFormat:= 'dd.mm.yy  hh:nn';
      if UpperCase(TMalOraQuery(DataSet).Fields[i].FieldName) = 'LAST_DATE_OPERATION' then
         TTimeField(TMalOraQuery(DataSet).Fields[i]).DisplayFormat:= 'dd.mm.yy  hh:nn';
    end;
end;


function TfmRwWagonDislocationEx.GetPlaceStrID(aRowNum:Integer; var aPlace_ID: Integer; var aOperaionMode: Integer; var aPlace_Str_ID: Integer) :Integer;
var
   l_ID : Integer;
begin

  Result    := 0;
  aPlace_ID := 0;

  if aRowNum=0 then
     begin
       Result    := -1;
       aPlace_ID := -1;
       Exit;
     end;

  l_ID := placeAbility[aRowNum].L_PLACE_STR_ID;

  quGetPlaceStr_ID.Close;
  quGetPlaceStr_ID.ParamByName('P_Shpt_Place_Str_ID').AsInteger := l_ID;
  quGetPlaceStr_ID.Open;

  if quGetPlaceStr_ID.RecordCount<>0 then
     begin
       quGetPlaceStr_ID.First;
       Result        := VarToInt(quGetPlaceStr_ID['NO'],0);
       aPlace_ID     := VarToInt(quGetPlaceStr_ID['SHPT_PLACE_ID'],0);
       aOperaionMode := VarToInt(quGetPlaceStr_ID['F_OPERATION'],0);
       aPlace_Str_ID := l_ID;
     end;

end;


procedure TfmRwWagonDislocationEx.frSelectedListacViewCardExecute(
  Sender: TObject);
begin
//  RwWagonListCard(LSession,quSelectedWagon['Rw_Wagon_List_ID'],cmView,0,quSelectedWagon['Idle_begin_Date'],quSelectedWagon['Depart_Date'],quSelectedWagon['Arrival_Date'],0);
end;

// 1
procedure TfmRwWagonDislocationEx.frPlace_1acViewCardExecute(
  Sender: TObject);
begin showOperation(BrowseRefParams, ((Sender as TComponent).Owner as TfrSDIBrowse), cmView); end;

procedure TfmRwWagonDislocationEx.sb1UpClick(Sender: TObject);
begin
  inherited;
    ArrowUpDownPressed(1, mvUp);
end;

procedure TfmRwWagonDislocationEx.sb1DownClick(Sender: TObject);
begin
  inherited;
    ArrowUpDownPressed(1, mvDown);
end;

// 2
procedure TfmRwWagonDislocationEx.frPlace_2acViewCardExecute(
  Sender: TObject);
begin showOperation(BrowseRefParams, ((Sender as TComponent).Owner as TfrSDIBrowse), cmView); end;

procedure TfmRwWagonDislocationEx.sb2UpClick(Sender: TObject);
begin
  inherited;
    ArrowUpDownPressed(2, mvUp);
end;
procedure TfmRwWagonDislocationEx.sb2DownClick(Sender: TObject);
begin
  inherited;
    ArrowUpDownPressed(2, mvDown);
end;

// 3
procedure TfmRwWagonDislocationEx.frPlace_3acViewCardExecute(
  Sender: TObject);
begin showOperation(BrowseRefParams, ((Sender as TComponent).Owner as TfrSDIBrowse), cmView); end;

procedure TfmRwWagonDislocationEx.sb3UpClick(Sender: TObject);
begin
  inherited;
    ArrowUpDownPressed(3, mvUp);
end;

procedure TfmRwWagonDislocationEx.sb3DownClick(Sender: TObject);
begin
  inherited;
    ArrowUpDownPressed(3, mvDown);
end;

procedure TfmRwWagonDislocationEx.N4Click(Sender: TObject);
begin
  inherited;
    Close();
end;

procedure TfmRwWagonDislocationEx.N2Click(Sender: TObject);
begin
  inherited;
   BrowseRefParams.BrowseOptionSet := [boEdit];
   FeedWagonForShpt(BrowseRefParams);
end;

procedure TfmRwWagonDislocationEx.N1Click(Sender: TObject);
begin
  inherited;
   BrowseRefParams.BrowseOptionSet := [boEdit];
   FeedWagonForUShpt(BrowseRefParams,0);
end;

procedure TfmRwWagonDislocationEx.N3Click(Sender: TObject);
begin
  inherited;
  BrowseRefParams.BrowseOptionSet := [boEdit];
  ShowWagonsInTerritory(BrowseRefParams);
end;

procedure TfmRwWagonDislocationEx.cbxUniSubclientChange(Sender: TObject);
begin
  inherited;
    if not Self.Visible then EXIT;
    if modalResult=mrOk then EXIT;
    If F_UpdateMode = 0 then Exit;

    F_FULL_REOPEN:=1;
    F_LIMIT_UNI_PLACES:=1;
    ReopenMainQuery;
    UpdateQueryDislocationPlaces();
    F_LIMIT_UNI_PLACES:=0;
    F_FULL_REOPEN:=0;
end;

procedure TfmRwWagonDislocationEx.frBrowseRwWagonListacClearFilterExecute(
  Sender: TObject);
begin
  inherited;
  frBrowseRwWagonList.acClearFilterExecute(Sender);
end;

procedure TfmRwWagonDislocationEx.UpdateDataSubClient;
{ обновление данных - список субклиентов}
begin
    if cbLightShow.Checked=True then
       Exit;

    if VarToInt(cbxUniSubclient.KeyValue,0) = 0 then
       begin
          quUniSubclient.Close;
//          quUniSubclient.MacroByName('MainSQL').Value := sqlFromUniques.FinalSQL;
          quUniSubclient.Open;
       end;
end;

procedure TfmRwWagonDislocationEx.UpdateDataWagonOwner;
{ обновление данных - список арендаторов}
begin
    if cbLightShow.Checked=True then
       Exit;

    if VarToInt(cbxUniWagonOwner.KeyValue,0) = 0 then
       begin
          quUniWagonOwners.Close;
          //QuUniWagonOwners.MacroByName('MainSQL').Value := sqlFromUniques.FinalSQL;
          quUniWagonOwners.Open;
       end;
end;

procedure TfmRwWagonDislocationEx.cbxUniWagonOwnerChange(Sender: TObject);
begin
  inherited;
    if not Self.Visible then EXIT;
    if modalResult=mrOk then EXIT;
    If F_UpdateMode = 0 then Exit;

    F_FULL_REOPEN:=1;
    F_LIMIT_UNI_PLACES:=1;
    ReopenMainQuery;
    UpdateQueryDislocationPlaces();
    F_LIMIT_UNI_PLACES:=0;
    F_FULL_REOPEN:=0;
end;

procedure TfmRwWagonDislocationEx.rbFilterByListBrowseButtonClick(
  Sender: TObject);
var
   Loc_IsWagonListValid : Boolean;
   Loc_Exclude_Str      : String;
begin
  inherited;
    loc_WagonListStr  := Trim(edWagonList.Text);
    loc_CommaCountStr := '';
    Loc_IsWagonListValid := IsWagonListValid(loc_WagonListStr,Loc_CommaCountStr);
    if Loc_IsWagonListValid = False then
       begin
        edWagonList.SetFocus;
        Exit;
       end
    else
       begin
         edWagonList.Text := loc_WagonListStr;

         F_FULL_REOPEN:=1;
         F_LIMIT_UNI_PLACES:=1;

         cbShowAllWagons.Checked:=True;

         ReopenMainQuery();
         UpdateAll_QueryPlaces();

         F_FULL_REOPEN:=0;
         F_LIMIT_UNI_PLACES:=0;

         sqlExcludeWagonsFromList.Session := LSession;
         quSelectRwWagonList.MacroByName('m_distinct').Value:= ' ';
         sqlExcludeWagonsFromList.MacroByName('MainSql').Value := quSelectRwWagonList.FinalSQL;
         sqlExcludeWagonsFromList.Params := quSelectRwWagonList.Params;
         sqlExcludeWagonsFromList.ParamByName('P_Wagon_LIST').AsString := '(' + edWagonList.Text + ')';
         sqlExcludeWagonsFromList.Execute;
         Loc_Exclude_Str  := sqlExcludeWagonsFromList.ParamByName('P_EXCLUDE_WAGONS').AsString;
         edWagonList.Text := Loc_Exclude_Str;
       end;
end;

procedure TfmRwWagonDislocationEx.rbFilterByListCleanButtonClick(
  Sender: TObject);
begin
  inherited;
    edWagonList.Text := '';
    F_FULL_REOPEN:=1;
    F_LIMIT_UNI_PLACES:=1;
    cbShowAllWagons.Checked:=True;
    ReopenMainQuery();
    UpdateAll_QueryPlaces();
    F_FULL_REOPEN:=0;
    F_LIMIT_UNI_PLACES:=0;
end;

procedure TfmRwWagonDislocationEx.frBrowseRwWagonListdgrBrowseGetCellParams(
  Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;

  with frBrowseRwWagonList do
   if not (gdSelected in State) then
   begin

     if ( DataSet['DEPART_TECH_COND_SID'] = 32400001 )         // больные
     and ( Column.FieldName = 'DEPART_TECH_COND_SHORT_NAME' ) then
        AFont.Color := clRed;

     if ( DataSet['CARGO_EXIST_DEPART_SID'] = 32500001 )    // порожние
     and ( Column.FieldName = 'CARGO_EXIST_ARRIVAL_NAME' ) then
        AFont.Color := clRed;

     if ( DataSet['CARGO_EXIST_DEPART_SID'] = 32500002 )     //  груженые
     and ( Column.FieldName = 'CARGO_EXIST_ARRIVAL_NAME' ) then
        AFont.Style := [fsBold];

     if ( DataSet['CARGO_EXIST_ARRIVAL_NAME'] = 'ПОР' )    // порожние
     and ( Column.FieldName = 'CARGO_EXIST_ARRIVAL_NAME' ) then
        AFont.Color := clRed;

     if ( DataSet['CARGO_EXIST_ARRIVAL_NAME'] = 'ГРУ' )   //  груженые
     and ( Column.FieldName = 'CARGO_EXIST_ARRIVAL_NAME' ) then
        AFont.Style := [fsBold];

     if ( DataSet['CARGO_EXIST_DEPART_NAME'] = 'ПОР' )    // порожние
     and ( Column.FieldName = 'CARGO_EXIST_DEPART_NAME' ) then
        AFont.Color := clRed;

     if ( DataSet['CARGO_EXIST_DEPART_NAME'] = 'ГРУ' )   //  груженые
     and ( Column.FieldName = 'CARGO_EXIST_DEPART_NAME' ) then
        AFont.Style := [fsBold];

     if ( DataSet['RW_REG_NO'] <> 20 )        // Разметка не Россия
     and ( Column.FieldName = 'RW_REG_NO' ) then
        AFont.Color := clRed;
     if ( DataSet['RW_REG_NO'] <> 20 )
     and ( Column.FieldName = 'RW_REG_NAME' ) then
        AFont.Color := clRed;

     if ( DataSet['F_SELF'] = 1 )                // собственные вагоны
     and ( Column.FieldName = 'WAGON_NO' ) then
        AFont.Color := clGreen;

     if ( DataSet['WAGON_OWNER_FIRM_ID'] <> 0 )        // Разметка не Россия
     and ( Column.FieldName = 'WAGON_NO' ) then
        AFont.Color := clFuchsia;

     if ( DataSet['IN_RW_SUBCLIENT_ID'] <> Null )   // вагоны субклиентов
     and ( Column.FieldName = 'WAGON_NO' ) then
        AFont.Color := clRed;

     if ( VarToStr(DataSet['COLOR_MARK'])<>'' )                // собственные вагоны
     and ( Column.FieldName = 'WAGON_NO' ) then
        begin
           AFont.Color := clBlack;
           If VarToStr(DataSet['COLOR_MARK'])='clYellow'  then Background := clYellow;
           If VarToStr(DataSet['COLOR_MARK'])='clLime'    then Background := clLime;
           If VarToStr(DataSet['COLOR_MARK'])='clAqua'    then Background := clAqua;
           If VarToStr(DataSet['COLOR_MARK'])='clRed'     then Background := clRed;
           If VarToStr(DataSet['COLOR_MARK'])='clFuchsia' then Background := clFuchsia;
        end;

     if ( VarToInt(DataSet['DAYS_REPAIR'],0) <= 30 )   // дней до капремонта
     and ( Column.FieldName = 'DAYS_REPAIR' ) then
        begin
          AFont.Color := clRed;
          Afont.Size  := 9;
          AFont.Style := [fsBold];
        end;

   end;

end;

procedure TfmRwWagonDislocationEx.frBrowseRwWagonListacViewCardExecute(
  Sender: TObject);
begin
  RwWagonListCard(LSession,quSelectRwWagonList['Rw_Wagon_List_ID'],cmView,0,quSelectRwWagonList['Idle_begin_Date'],quSelectRwWagonList['Depart_Date'],quSelectRwWagonList['Arrival_Date'],0);
end;


procedure TfmRwWagonDislocationEx.rgType_DislocClick(Sender: TObject);
begin
  inherited;
  If F_UpdateMode = 0 then Exit;

    F_FULL_REOPEN:=1;
    F_LIMIT_UNI_PLACES:=1;
    ReopenMainQuery();
    UpdateAll_QueryPlaces();
    F_FULL_REOPEN:=0;
    F_LIMIT_UNI_PLACES:=0;
end;

procedure TfmRwWagonDislocationEx.rbWagonActionCleanButtonClick(
  Sender: TObject);
begin
  inherited;
    Loc_WagonActionSID    := 0;
    laWagonAction.Caption := '';
    F_FULL_REOPEN:=1;
    F_LIMIT_UNI_PLACES:=1;
    ReopenMainQuery();
    UpdateAll_QueryPlaces();
    F_FULL_REOPEN:=0;
    F_LIMIT_UNI_PLACES:=0;
end;

procedure TfmRwWagonDislocationEx.rbWagonActionBrowseButtonClick(
  Sender: TObject);
begin
  inherited;
    BrowseRefParams.BrowseOptionSet := [boSelect];
    BrowseRefParams.DatePeriod.EndDate := Now();
    iunsi.SelectService(browseRefParams, 487 );
    if browseRefParams.SDIResult = mrOK then
    begin
      Loc_WagonActionSID    := VarToInt(browseRefParams.DataSet['SERVICE_ID'],0);
      laWagonAction.Caption := VarToStr(browseRefParams.DataSet['NAME']);
      F_FULL_REOPEN:=1;
      F_LIMIT_UNI_PLACES:=1;
      ReopenMainQuery();
      UpdateAll_QueryPlaces();
      F_FULL_REOPEN:=0;
      F_LIMIT_UNI_PLACES:=0;
    end;

end;

procedure TfmRwWagonDislocationEx.frShptPlacesdgrBrowseCanSelectRecord(
  Sender: TObject; var CanSelectRow: Boolean);
begin
  inherited;
     if frShptPlaces.dgrBrowse.MSelectedCount >= 5 then
        begin
          uMessages.Error('Можно отметить не более 5 записей');
          CanSelectRow := False;
        end;
end;

procedure TfmRwWagonDislocationEx.ShowPlaceValues(aPlaceNo: Integer);
var i, xx, yy, cnt: integer;
var saveColor: TColor;
begin

  if placeAbility[aPlaceNo].L_PLACE_STR_ID = 0 then begin
     placeAbility[aPlaceNo].lblSelected.Caption := '';
     placeAbility[aPlaceNo].lblPlace.Caption := '';
     placeAbility[aPlaceNo].laPlaceName := '';
     placeAbility[aPlaceNo].lblPlaceStr.Caption := '';
     placeAbility[aPlaceNo].lblOperation_MODE.Caption := '';
     placeAbility[aPlaceNo].cbTempOutput.Visible := false;
     placeAbility[aPlaceNo].frPlace.dgrBrowse.MSelectedRows.Clear;
     exit;
  end;

  iunsi.GetDataA(BrowseRefParams,'Select Nvl(sp.RW_SUBCLIENT_ID,0) as RW_SUBCLIENT_ID, sp.name as PlaceName, st.Name as PlaceStrName, st.F_OPERATION, st.F_CLEARING, st.WAGON_QNTY from shpt_place_Str st, shpt_place sp where sp.shpt_place_ID=st.shpt_place_id and shpt_place_Str_ID=:P_ID',[placeAbility[aPlaceNo].L_PLACE_STR_ID]);
  if BrowseRefParams.SDIResult<>mrOk then  begin
     placeAbility[aPlaceNo].L_PLACE_STR_ID := 0;
     ShowPlaceValues(aPlaceNo);
     exit;
  end;

  placeAbility[aPlaceNo].L_PLACE_WAGON_QNTY := VarToInt(BrowseRefParams.DataSet['WAGON_QNTY'],0);
  placeAbility[aPlaceNo].freshRepositionListID := '';
  placeAbility[aPlaceNo].subclient := VarToInt(BrowseRefParams.DataSet['RW_SUBCLIENT_ID'],0);

  placeAbility[aPlaceNo].laPlaceName := VarToStr(BrowseRefParams.DataSet['PlaceName']);
  placeAbility[aPlaceNo].lblPlace.Caption := placeAbility[aPlaceNo].laPlaceName;
  if placeAbility[aPlaceNo].PlaceIsLocked then
     placeAbility[aPlaceNo].lblPlace.Caption := '(БЛОК) ' + placeAbility[aPlaceNo].laPlaceName;

  placeAbility[aPlaceNo].lblPlaceStr.Caption := VarToStr(BrowseRefParams.DataSet['PlaceStrName']);
  if placeAbility[aPlaceNo].L_PLACE_WAGON_QNTY<>0 then
     placeAbility[aPlaceNo].lblPlaceStr.Caption := placeAbility[aPlaceNo].lblPlaceStr.Caption + ' (' + VarToStr(placeAbility[aPlaceNo].L_PLACE_WAGON_QNTY) + ')';

  placeAbility[aPlaceNo].L_PLACE_OPERATION    := VarToInt(BrowseRefParams.DataSet['F_OPERATION'],0);

  placeAbility[aPlaceNo].cbTempOutput.Visible := false;
  placeAbility[aPlaceNo].cbTempOutput.Checked := false;

  case placeAbility[aPlaceNo].L_PLACE_OPERATION of
     0: placeAbility[aPlaceNo].lblOperation_MODE.Caption := 'МНВР';
     1: placeAbility[aPlaceNo].lblOperation_MODE.Caption := 'ВГР';
     2: begin
          placeAbility[aPlaceNo].lblOperation_MODE.Caption := 'ПГР';
          placeAbility[aPlaceNo].cbTempOutput.Visible := true;
        end;
     3: begin
          placeAbility[aPlaceNo].lblOperation_MODE.Caption := 'СДВ';
          placeAbility[aPlaceNo].cbTempOutput.Visible := true;
        end;
     4: placeAbility[aPlaceNo].lblOperation_MODE.Caption := 'МНВР';
  end;

  // отобразим статусы вагонов, принимаемых на данной станции
  placeAbility[aPlaceNo].legend := TBitMap.Create;
  placeAbility[aPlaceNo].legend.Width := 42;
  placeAbility[aPlaceNo].legend.Height := 14;

  saveColor := placeAbility[aPlaceNo].legend.Canvas.Brush.Color;
  placeAbility[aPlaceNo].legend.Canvas.Brush.Color := clBtnFace;
  placeAbility[aPlaceNo].legend.Canvas.FloodFill(1,1, clRed, fsBorder);

  placeAbility[aPlaceNo].legend.Canvas.Brush.Color := saveColor;

  cnt := 0;
  for i := 0 to 3 do begin
     if allowReposition[i][placeAbility[aPlaceNo].L_PLACE_OPERATION] = 0 then continue;
     inc(cnt);
  end;

  xx := 2+ (3-cnt)*12; yy := 2;
  for i := 0 to 3 do begin
     if allowReposition[i][placeAbility[aPlaceNo].L_PLACE_OPERATION] = 0 then continue;
     drawStatus(placeAbility[aPlaceNo].legend, statusSet[i], xx, yy);
     xx := xx + 12;
  end;

  // список возможных операций на точке
  if placeAbility[aPlaceNo].operation = nil then
     placeAbility[aPlaceNo].operation := TStringList.Create;

  // перечень уникальных номеров составов
  if placeAbility[aPlaceNo].trainList = nil then begin
     placeAbility[aPlaceNo].trainList := TStringList.Create;
     placeAbility[aPlaceNo].trainList.Duplicates := dupIgnore;
  end;

  // список отмеченных операций/вагонов
  if placeAbility[aPlaceNo].selectOperList = nil then begin
     placeAbility[aPlaceNo].selectOperList := TStringList.Create;
  end;

  placeAbility[aPlaceNo].operation.Clear;
  case placeAbility[aPlaceNo].L_PLACE_OPERATION of
    0: placeAbility[aPlaceNo].operation.add('2900001;МАНЕВРОВЫЕ');
    1: placeAbility[aPlaceNo].operation.add('2900002;ВЫГРУЗКА');
    2: placeAbility[aPlaceNo].operation.add('2900003;ПОГРУЗКА');
    3: begin
        placeAbility[aPlaceNo].operation.add('2900002;ВЫГРУЗКА');
        placeAbility[aPlaceNo].operation.add('2900003;ПОГРУЗКА');
       end;
    4: placeAbility[aPlaceNo].operation.add('2900001;МАНЕВРОВЫЕ');
  end;

  if VarToInt(BrowseRefParams.DataSet['F_CLEARING'],0) = 1 then begin
    placeAbility[aPlaceNo].operation.add('2900005;ЗАЧИСТКА');
    placeAbility[aPlaceNo].lblOperation_MODE.Caption := placeAbility[aPlaceNo].lblOperation_MODE.Caption + '(+ЗЧС)';
  end;

  placeAbility[aPlaceNo].imLegend.Canvas.Brush.Color := clBtnFace;
  placeAbility[aPlaceNo].imLegend.Canvas.FloodFill(1,1, clRed, fsBorder);
  placeAbility[aPlaceNo].imLegend.Canvas.Draw(0,0,placeAbility[aPlaceNo].legend);

end;

procedure TfmRwWagonDislocationEx.ClearPlaceValues(aPlaceNo:Integer);
begin
   SetPlaceDSL(aPlaceNo, 0);
end;

procedure TfmRwWagonDislocationEx.SaveToIniFileParams();
var
  reg:Registry.TRegistry;
begin
  try
    reg:=Registry.TRegistry.Create();
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey(REGISTRY_ROOT_PATH,true);

      reg.WriteInteger('PLACE_STR_1_ID',placeAbility[1].L_PLACE_STR_ID);
      reg.WriteInteger('PLACE_STR_2_ID',placeAbility[2].L_PLACE_STR_ID);
      reg.WriteInteger('PLACE_STR_3_ID',placeAbility[3].L_PLACE_STR_ID);

      reg.WriteInteger('OPER_MODE',rgOperationMode.ItemIndex);

    finally
      reg.Free();
    end;
  except
    on e: Exception do
    begin
      uMessages.Error(e.Message);
    end;
  end;
end;

procedure TfmRwWagonDislocationEx.LoadIniParams();
var
  reg:Registry.TRegistry;
  i: integer;
begin
  try

    reg:=Registry.TRegistry.Create();
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey(REGISTRY_ROOT_PATH,true);

      for i := 1 to 3 do begin
          placeAbility[i].L_PLACE_STR_ID := 0;
          if Reg.ValueExists('PLACE_STR_'+IntToStr(i)+'_ID') then
             SetPlaceDSL(i, Reg.ReadInteger('PLACE_STR_'+IntToStr(i)+'_ID'))
          else
             SetPlaceDSL(i, 0);
      end;

      if Reg.ValueExists('OPER_MODE') then
         rgOperationMode.ItemIndex:=Reg.ReadInteger('OPER_MODE')
      else
         reg.WriteInteger('OPER_MODE',0);

    finally
      reg.Free();
    end;
  except
    on e: Exception do
    begin
      uMessages.Error(e.Message);
      Exit;
    end;
  end;

end;


procedure TfmRwWagonDislocationEx.btExecTimeByInitClick(Sender: TObject);
var msk_time: TDateTime;
begin
  inherited;
//     dtpDate_In.Date := Trunc(Now());
//     dtpTime_In.Time := Now()- Trunc(Now()) - 1/24*2;

//   dtpDate_In.Date := Trunc(Now()-1/24*2);
//   dtpTime_In.Time := Now()-1/24*2 - Trunc(Now()-1/24*2);

   msk_time := Now()-1/24*2;
   dtpDate_In.Date := Trunc(msk_time);
   dtpTime_In.Time := msk_time - Trunc(msk_time);
end;

procedure TfmRwWagonDislocationEx.btSetlocomotiveBrowseButtonClick(
  Sender: TObject);
begin
  inherited;
//    if debugMode <> dmIsOn then debugMode := dmIsOn
//    else debugMode := dmIsOff;

    BrowseRefParams.BrowseOptionSet := [boSelect];
    BrowseRefParams.DatePeriod.EndDate := Now();
    SelectService(BrowseRefParams,803);
    if BrowseRefParams.SDIResult = mrOk then
       begin
         LOC_LOCOMOTIVE_SID       := VarToInt(BrowseRefParams.DataSet['SERVICE_ID']);
         laLocomotiveName.Caption := VarToStr(BrowseRefParams.DataSet['NAME']);
       end;
end;

procedure TfmRwWagonDislocationEx.btSetlocomotiveCleanButtonClick(
  Sender: TObject);
begin
  inherited;
    LOC_LOCOMOTIVE_SID       := 0;
    laLocomotiveName.Caption := '';
end;

procedure TfmRwWagonDislocationEx.frBrowseRwWagonListdgrBrowseMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
    if frBrowseRwWagonList.dgrBrowse.MSelectedRows.Count>0 then
       begin
         L_Move_From_WL := 1;
         frBrowseRwWagonList.BeginDrag(False);
       end;
end;

procedure TfmRwWagonDislocationEx.frBrowseRwWagonListacEditExecute(
  Sender: TObject);
Var
  SaveID     : Integer;
  Loc_Idle_Begin_Date  : TdateTime;
  Loc_Arrival_Date     : TdateTime;
  Loc_Depart_Date      : TdateTime;
begin
  inherited;
    SaveID := VarToInt(quSelectRwWagonList['Rw_Wagon_List_ID'],0);

    If VarToDate(quSelectRwWagonList['Idle_begin_Date']) <> 0 then
       Loc_Idle_Begin_Date := VarToDateTime(quSelectRwWagonList['Idle_begin_Date'])
    else
      Loc_Idle_Begin_Date := 0;

    if VarToDate(quSelectRwWagonList['Arrival_Date']) <> 0 then
       Loc_Arrival_Date  := VarToDateTime(quSelectRwWagonList['Arrival_Date'])
    else
       Loc_Arrival_Date  := 0;

    If VarToDate(quSelectRwWagonList['Depart_Date']) <> 0 then
       Loc_Depart_Date := VarToDateTime(quSelectRwWagonList['Depart_Date'])
    else
       Loc_Depart_Date := 0;

   RwWagonListCard(Lsession,quSelectRwWagonList['Rw_Wagon_List_ID'],cmEdit,0,Loc_Idle_Begin_Date,Loc_Depart_Date ,Loc_Arrival_Date,0);

   frBrowseRwWagonList.acRefreshExecute(Sender);
   frBrowseRwWagonList.DataSet.Locate('Rw_Wagon_List_ID', SaveID, []);
   If Self.Visible then
      frBrowseRwWagonList.dgrBrowse.SetFocus;

end;

//=================================================================================================
{
procedure TfmRwWagonDislocationEx.UpdateQuerySelectedWagons(aOperationType:Integer);
begin

  quSelectedWagon.Close;
//  quSelectedWagon.ParamByName('P_Operation_Type').AsInteger := aoperationType;
  quSelectedWagon.Open;

  if frSelectedList.dsBrowse.DataSet.RecordCount<>0 then
     frSelectedList.dgrBrowse.MSelectedRows.Clear();

  frSelectedList.UpdateActionStatus();
  frSelectedList_2.UpdateActionStatus();

end;
}

//=================================================================================================
procedure TfmRwWagonDislocationEx.frPlace_1dgrBrowseMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var str: string;
var src: TMalDBGrid;
    cell: TGridCoord;
begin
  inherited;
  src := (Sender as TMalDBGrid);

  if mbRight = Button then  begin
     gsmPlaceState.Grid := placeAbility[src.tag].frPlace.dgrBrowse;

     str := placeAbility[src.tag].lblOperation_MODE.Caption;
     if not cbLightShow.Checked then str := str + '+';

     gsmPlaceState.Mode := str;
     gsmPlaceState.PopUpMenu := placeAbility[src.tag].frPlace.pmBrowse;
  end;

  if not ((mbLeft = Button) and (not placeAbility[src.tag].frPlace.DataSet.IsEmpty)) then Exit;

  if placeAbility[src.tag].frPlace.dgrBrowse.MSelectedRows.Count>0 then begin
     if wasShowOperation then begin
        wasShowOperation := false;
     end else begin
        cell := src.MouseCoord(X,Y);
        if cell.Y <= src.DataSource.DataSet.RecordCount then begin
          if placeAbility[src.tag].selectOperList.IndexOf(src.DataSource.DataSet.FieldByName('RW_WAGON_OPER_ID').AsString) >= 0 then
             placeAbility[src.tag].frPlace.BeginDrag(False);
        end;

     end;
  end;

end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.frPlace_1dgrBrowseDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := true;
  if placeAbility[(Sender as TMalDBGrid).tag].L_PLACE_STR_ID = 0 then Accept := False;
end;


//=================================================================================================
function TfmRwWagonDislocationEx.getWagonPlace(src: TfrSDIBrowse): integer;
begin
  if src.tag = BUFFER_PLACE then begin
      // перенос из буфера, добудем статус из ДатаСета
      //result := VarToInt(src.dgrBrowse.DataSource.DataSet['last_Place_ID'],0);
      result := VarToInt(src.dgrBrowse.DataSource.DataSet['OPER_PLACE_ID'],0);
   end else begin
      result := placeAbility[src.tag].L_PLACE_STR_ID;
   end;
end;

//=================================================================================================
function TfmRwWagonDislocationEx.checkTime: boolean;
   begin
     result := true;
     If (SetupDateTime - Int(SetupDateTime)=0) then   begin
        If umessages.QuestionYes('В устанавливаемой дате отсутствует ВРЕМЯ. Установить текущее' ) then begin
           btExecTimeByInitClick(Self);
           exit;
        end else begin
           umessages.Error('Время не установлено');
           result := false;
           exit;
        end;
     end;
     if (ABS((Now()-1/24*2 - SetupDateTime)) >  1/24/20 ) then begin
        if umessages.QuestionYes('ВРЕМЯ отличается от установленного более чем на 5 минут. Установить текущее ' ) then begin
           btExecTimeByInitClick(Self);
           exit;
        end else begin
           if F_NEED_TIME_MOVING_CTRL=0 then begin
              umessages.Error('Время не установлено');
              result := false;
              exit;
           end;
        end;
     end;
     if SetupDateTime > Now()-1/24*2 then begin
        umessages.Error('Устанавливаемое дата-время не может быть больше текущего ' );
        result := false;
        exit;
     end;
   end;

//=================================================================================================
function tempOutput(ds: TDataSet): boolean;
begin
  result:=false;
  if VarToInt(ds['nested_level'],0) <> 0 then begin
     if ds['ANCESTOR_PLACE_WSHOP_ID'] <> ds['OPER_PLACE_WSHOP_ID'] then result := true; // временно выведен
  end;
end;

//=================================================================================================
function typeOperation(ds: TDataSet): integer;
begin
   result := VarToInt(ds['ANCESTOR_TYPE_SID'],0);
   if result = 0 then
      result := VarToInt(ds['OPERATION_TYPE_SID'],0);
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.rePosition(Sender,Source: TObject; X, Y: Integer);
                                                                
function getSrcTag(oper_id: integer): integer;
begin
  result := -1;
  iunsi.getDataA(BrowseRefParams,
        'select ct.var1 as SRC_TAG from tmp_cache_table ct where ct.taskID = 7 and ct.objID = :P_ID and ct.var1 <> 4',[oper_id]);
  if BrowseRefParams.SDIResult=mrOk then
     result := VarToInt(BrowseRefParams.Dataset['SRC_TAG'],0);
end;

var
  src: TfrSDIBrowse;
  dst: TMalDBGrid;
  cell: TGridCoord;
  srcTag: integer;
  i,j, destID, flowID, dstSaveFlowID, srcSaveFlowID: integer;
  srcTrainNumber,dstTrainNumber: integer;
  msg, listSelectedID, saveID, res: string;
  listDenyWagonOpID, listDenyWagon, listClaimedWagon, listMovedWagon: string;
  upd: boolean;

  hash_sour_before, hash_sour_after,
  hash_dest_before, hash_dest_after: string;

  wagonState: integer;
  wagonReposition: integer;
  locomotiveID: integer;

  idx, typeOp, flowTypeOp: integer;
  listAllowOper: TStringList;
  listTrain: TStringList;

  autoTime: boolean;
  lockInfo: string;
  chrono_err: boolean;
begin

  if not((Sender.ClassName = 'TMalDBGrid') and (Source.ClassName = 'TfrSDIBrowse')) then exit;

  src := (Source as TfrSDIBrowse);  dst := (Sender as TMalDBGrid);
  srcTag := src.tag;

  if (srcTag = dst.tag) then // перестановка внутри пути
     if not umessages.QuestionNo('Выполнить перестановку') then exit;

  cell := dst.MouseCoord(X, Y);
  if not ((cell.Y > 0) and (cell.Y <= dst.DataRowCount)) then begin
     if (srcTag = dst.tag) or (rgInsertMode.ItemIndex = 1) then
        exit;
  end;
  if not trueOrder(dst) then exit;

  if src.tag <> BUFFER_PLACE then
    LockWindowUpdate(placeAbility[src.tag].frPlace.Handle);
  if dst.tag <> BUFFER_PLACE then
    LockWindowUpdate(placeAbility[dst.tag].frPlace.Handle);

  dstSaveFlowID := -1;
  if not dst.DataSource.DataSet.IsEmpty then
     dstSaveFlowID := dst.DataSource.DataSet['RW_WAGON_OPER_ID'];

  srcSaveFlowID := -1;
  if not src.dgrBrowse.DataSource.DataSet.IsEmpty then
     srcSaveFlowID := src.dgrBrowse.DataSource.DataSet['RW_WAGON_OPER_ID'];

  listSelectedID := '';
  listTrain := TStringList.Create;

  for i := 0 to dst.MSelectedRows.Count-1 do begin
      dst.DataSource.DataSet.GotoBookmark(pointer(dst.MSelectedRows.Items[i]));
      listSelectedID := listSelectedID + ',' + VarToStr(dst.DataSource.Dataset['RW_WAGON_OPER_ID']) + ',';
      if listTrain.IndexOf(VarToStr(dst.DataSource.Dataset['TRAIN_NUMBER'])) < 0 then
         listTrain.Add(VarToStr(dst.DataSource.Dataset['TRAIN_NUMBER']));
  end;

  destID := 0;
  if (srcTag = dst.tag) or (rgInsertMode.ItemIndex = 1) then begin
     srcTrainNumber := VarToInt(dst.DataSource.Dataset['TRAIN_NUMBER'],0);
     dst.DataSource.Dataset.first;
     for i := 1 to cell.Y - 1 do
         dst.DataSource.Dataset.Next;
     destID := VarToInt(dst.DataSource.Dataset['RW_WAGON_OPER_ID'],0);
     dstTrainNumber := VarToInt(dst.DataSource.Dataset['TRAIN_NUMBER'],0);

     if ((srcTrainNumber <> dstTrainNumber) or (listTrain.Count <> 1)) and (srcTag = dst.tag) then begin
        umessages.Error('Данная перестановка возможна только внутри одного состава.' +CRLF+ 'Для перестановки вагонов между составами используйте меню Состав - Переставить...');

        restoreSelection(dst, listSelectedID + ',' + placeAbility[dst.tag].freshRepositionListID, dstSaveFlowID);
        LockWindowUpdate(0);

        exit;
     end;
  end;

  if (srcTag = dst.tag) then begin // перестановка внутри пути
     saveID := '';
     upd := false;

     hash_sour_before := getHash(placeAbility[srcTag].L_PLACE_STR_ID, now());
     for i := 0 to dst.MSelectedRows.Count - 1 do begin
         dst.DataSource.DataSet.GotoBookmark(pointer(dst.MSelectedRows.Items[i]));
         flowID := VarToInt(dst.DataSource.Dataset['RW_WAGON_OPER_ID'],0);
         saveID := saveID + ',' + IntToStr(flowID) + ',';

         if destID <> flowID then begin
            sqlMoveUpDown.ParamByName('P_SOUR_OP_ID').AsInteger := flowID;
            sqlMoveUpDown.ParamByName('P_DEST_OP_ID').AsInteger := destID;

            destID := flowID;

            sqlMoveUpDown.Execute;
            hash_sour_after  := getHash(placeAbility[srcTag].L_PLACE_STR_ID, now());

            res := sqlMoveUpDown.ParamByName('P_RESULT').AsString;
            if res <> '' then begin
               upd := true;
               rollbackProcess(internalRePosition,
               placeAbility[srcTag].L_PLACE_STR_ID,placeAbility[srcTag].L_PLACE_STR_ID,srcTag,srcTag,
                 hash_sour_before + ':' + hash_sour_after,
                 hash_sour_before + ':' + hash_sour_after,
                 res
                 );
               hash_sour_before := hash_sour_after;
            end;
         end;
     end;

     if upd then begin
        dst.MSelectedRows.Clear();
        UpdateQuery_Place(srcTag);

        LockWindowUpdate(src.Handle);

        rollbackProcess(nextStep);
        // воcстановим отметки перенесенных вагонов
        dst.DataSource.Dataset.first;
        for i := 0 to dst.DataRowCount-1 do begin
            if pos(VarToStr(','+dst.DataSource.Dataset['RW_WAGON_OPER_ID']) + ',', saveID) > 0 then
               dst.MSelectedRows.SetCurrentRowSelected(true);
            dst.DataSource.Dataset.Next;
        end;
     end;
  end else begin   // перестановка между путями
     // контроль времени
     autoTime := ((placeAbility[dst.tag].L_PLACE_OPERATION in [0,4]) or (placeAbility[dst.tag].subclient <> 0));

     // Если  в принципе стоит установка на контроль времени операции
     if F_NEED_TIME_MOVING_CTRL=1 then
       autoTime := false;

     if autoTime then begin
       btExecTimeByInitClick(Self);
     end else begin
       if not checkTime then begin LockWindowUpdate(0); exit; end;
     end;

     case rgInsertMode.ItemIndex of
       0: destID := -1; // вставка в хвост
       2: destID := -2; // вставка в голову
     end;

     listDenyWagon := ''; listDenyWagonOpID := '';  listClaimedWagon := ''; listMovedWagon := '';
     wagonReposition := src.dgrBrowse.MSelectedRows.Count;
     chrono_err := false;
     for i := 0 to src.dgrBrowse.MSelectedRows.Count-1 do begin
         src.DataSet.GotoBookmark(pointer(src.dgrBrowse.MSelectedRows.Items[i]));

         srcTag := src.tag;
         if (src.tag = BUFFER_PLACE) then begin
            srcTag := getSrcTag(varToInt(src.Dataset['RW_WAGON_OPER_ID'],0));
            if srcTag <= 0 then srcTag := src.tag;
         end;

         wagonState := VarToInt(src.Dataset['wagonState'],0);
         if tempOutput(src.Dataset) then wagonState := 3; // !!!!!!!!!!!!!

          // проверка операций в будущем
         if  VarToInt(src.Dataset['FUTURE_OPER_EXISTS'],0) = 1 then begin
           wagonState := 0;
           chrono_err := true;
         end;

         // проверка попытки "вставить" операцию в прошлое
         if  not src.DataSet.FieldByName('MAX_IN_DATE').IsNull then begin
           if VarToDateTime(src.DataSet['MAX_IN_DATE']) > SetupDateTime then begin
               addToString(listDenyWagon, VarToStr(src.Dataset['WAGON_NO']), ',');
               addToString(listDenyWagonOpID, VarToStr(src.Dataset['RW_WAGON_OPER_ID']), ',');
               wagonReposition := wagonReposition - 1;
               chrono_err := true;
           end;
         end;

         if (allowReposition[wagonState][placeAbility[dst.tag].L_PLACE_OPERATION] = 0)
// 20151214 смена схемы контроля
//             or (    // неподтвержденные вагоны на операции "погрузка"
//                (varToInt(src.Dataset['OPERATION_TYPE_SID'],0) = OP_SHIPMENT)
//                 and ((VarToInt(src.Dataset['F_CONFIRMED_OPER'],0) = 0) or (VarToInt(src.Dataset['F_AUTO'],0) = -3))
//                )
             then begin
               addToString(listDenyWagon, VarToStr(src.Dataset['WAGON_NO']), ',');
               addToString(listDenyWagonOpID, VarToStr(src.Dataset['RW_WAGON_OPER_ID']), ',');
               wagonReposition := wagonReposition - 1;
         end;

        if uLockObject.DSL_lockCheck(LSession, VarToInt(src.Dataset['rw_wagon_list_id'],0), lockInfo) then begin
           if lockInfo <> '' then begin
              umessages.Error('Работа с вагоном ' + VarToStr(src.Dataset['WAGON_NO']) + ' заблокирована пользователем: ' + #10#13 + lockInfo);
               addToString(listDenyWagon, VarToStr(src.Dataset['WAGON_NO']), ',');
               addToString(listDenyWagonOpID, VarToStr(src.Dataset['RW_WAGON_OPER_ID']), ',');
               wagonReposition := wagonReposition - 1;
           end;
        end;


         if (varToInt(src.Dataset['OPERATION_TYPE_SID'],0) = OP_SHIPMENT)
            and
            ((src.tag <> BUFFER_PLACE) and (placeAbility[srcTag].cbTempOutput.Visible and placeAbility[srcTag].cbTempOutput.Checked))
            and
            (VarToDate(src.Dataset['F_OUT_CLAIM_DATE']) <> 0)
            then
               addToString(listClaimedWagon, VarToStr(src.Dataset['WAGON_NO']), ',');
     end;

     if listClaimedWagon <> '' then begin
        If not umessages.QuestionYes('Вагоны:' + CRLF +
               listClaimedWagon + CRLF +
              'не могут быть временно выведены, т.к. существует заявка на окончательный вывод!' + CRLF +
              'Выполнить перемещение без этих вагонов' ) then begin
                LockWindowUpdate(0);
                exit;
        end;
        listClaimedWagon := ',' + listClaimedWagon + ',';
     end;

     if listDenyWagon <> '' then begin
        msg := 'Вагоны:' + CRLF +
           listDenyWagon + CRLF +
           'не могут быть перемещены на выбранную станцию!' + CRLF;

        if chrono_err then msg := msg + 'ЕСТЬ ОПЕРАЦИИ В БУДУЩЕМ!!!' + CRLF;

        If not umessages.QuestionYes( msg + 'Выполнить перемещение без этих вагонов' ) then begin
              LockWindowUpdate(0);
              exit;
        end;

     end;

     if wagonReposition + dst.DataRowCount > placeAbility[dst.tag].L_PLACE_WAGON_QNTY then
        If not umessages.QuestionYes('После перемещения вагонов ('
            + IntToStr(wagonReposition) + ' шт.) ' + CRLF + 'вместимость станции (max '
            + IntToStr(placeAbility[dst.tag].L_PLACE_WAGON_QNTY) + ') ' + CRLF +'будет превышена (+'
            + IntToStr(wagonReposition + dst.DataRowCount - placeAbility[dst.tag].L_PLACE_WAGON_QNTY)
            + ')! ' + CRLF + CRLF + 'Выполнить перемещение ' ) then begin
              LockWindowUpdate(0);
              exit;
        end;

     if wagonReposition <= 0 then begin
        LockWindowUpdate(0);
        exit;
     end;

     locomotiveID := 0;
     BrowseRefParams.BrowseOptionSet := [boSelect];
     BrowseRefParams.DatePeriod.EndDate := Now();
     SelectService(BrowseRefParams,803);
     if BrowseRefParams.SDIResult = mrOk then
        locomotiveID := VarToInt(BrowseRefParams.DataSet['SERVICE_ID']);
     if locomotiveID <= 0 then begin
        LockWindowUpdate(0);
        exit;
     end;

     upd := false;
     placeAbility[dst.tag].freshRepositionListID := '';
     for i := 0 to src.dgrBrowse.MSelectedRows.Count-1 do begin
         src.DataSet.GotoBookmark(pointer(src.dgrBrowse.MSelectedRows.Items[i]));

         if pos(','+VarToStr(src.Dataset['WAGON_NO'])+',',listClaimedWagon) > 0 then
            continue;
         if pos(','+VarToStr(src.Dataset['WAGON_NO'])+',',listDenyWagon) > 0 then
            continue;

// ????????????????
         wagonState := VarToInt(src.Dataset['wagonState'],0);
         if tempOutput(src.Dataset) then wagonState := 3; // !!!!!!!!!!!!!

         if  VarToInt(src.Dataset['FUTURE_OPER_EXISTS'],0) = 1 then begin
           wagonState := 0; // есть операции в будущем
         end;

         if allowReposition[wagonState][placeAbility[dst.tag].L_PLACE_OPERATION] = 0 then
            continue;
// ????????????????

         srcTag := src.tag;
         if (src.tag = BUFFER_PLACE) then begin
            srcTag := getSrcTag(varToInt(src.Dataset['RW_WAGON_OPER_ID'],0));
            if srcTag <= 0 then srcTag := src.tag;
         end;

         idx := 0;
         listAllowOper := TStringList.Create;
         // отфильтруем доступные операции по статусу wagonState
         for j := 0 to placeAbility[dst.tag].operation.Count-1 do begin
            if pos(';'+uStrUtils.ExtractWord(1, placeAbility[dst.tag].operation[j], [';']) + ';', ';'+allowOper[wagonState]+';') > 0 then
               listAllowOper.Add(placeAbility[dst.tag].operation[j]);
         end;

         if F_CARGO_OPERATION <> 0 then begin
            listAllowOper.Clear;
            listAllowOper.add('2900001;МАНЕВРОВЫЕ');
         end;

         if listAllowOper.Count <= 0 then begin
            umessages.Error('На станции назначения нет операций, разрешенных для данного статуса вагона: ' +allowOper[wagonState] );
            continue;
         end;

         // если на точке возможно несколько операций
         if listAllowOper.Count > 1 then begin
           idx := SelectVariant(listAllowOper, 2, [';'],
                'Вагон: ' + VarToStr(src.Dataset['WAGON_NO']) + '. Выберите операцию');
            if idx < 0 then begin
               addToString(listDenyWagonOpID, VarToStr(src.Dataset['RW_WAGON_OPER_ID']), ',');
               continue;
            end;
         end;
         typeOp := StrToInt(uStrUtils.ExtractWord(1, listAllowOper[idx], [';']));


         if srcTag <> BUFFER_PLACE then
            hash_sour_before := getHash(placeAbility[srcTag].L_PLACE_STR_ID, now());

         hash_dest_before := getHash(placeAbility[dst.tag].L_PLACE_STR_ID, now());

         if srcTag <> BUFFER_PLACE then
           if placeAbility[srcTag].hash <> hash_sour_before then begin
              umessages.Error('Состояние точки <' +
                 placeAbility[srcTag].lblPlace.Caption + ' ' + placeAbility[srcTag].lblPlaceStr.Caption
                 + '> было изменено. Обновите грид');
              continue;
           end;

         if placeAbility[dst.tag].hash <> hash_dest_before then begin
            umessages.Error('Состояние точки <' +
               placeAbility[dst.tag].lblPlace.Caption + ' ' + placeAbility[dst.tag].lblPlaceStr.Caption
               + '> было изменено. Обновите грид');
            continue;
         end;

         sqlWagonRePosition.ParamByName('P_RW_WAGON_LIST_ID').AsInteger := VarToInt(src.Dataset['RW_WAGON_LIST_ID'],0);
         sqlWagonRePosition.ParamByName('P_ANCESTOR_OPER_ID').AsInteger := varToInt(src.Dataset['ANCESTOR_ID'],0);
         //sqlWagonRePosition.ParamByName('P_RW_WAGON_OPER_ID').AsInteger := VarToInt(src.Dataset['RW_WAGON_OPER_ID'],0);
         sqlWagonRePosition.ParamByName('P_TYPE_OP').AsInteger := typeOp;

         sqlWagonRePosition.ParamByName('P_DATE').AsDateTime := SetupDateTime;

         sqlWagonRePosition.ParamByName('P_PLACE_FROM').AsInteger := getWagonPlace(src);
         sqlWagonRePosition.ParamByName('P_PLACE_TO').AsInteger   := placeAbility[dst.tag].L_PLACE_STR_ID;
         sqlWagonRePosition.ParamByName('P_NOTE').AsString := 'rePosition';

         sqlWagonRePosition.ParamByName('P_PARENT_ID').AsInteger := VarToInt(src.Dataset['RW_WAGON_OPER_ID'],0);
         sqlWagonRePosition.ParamByName('P_PARENT_TYPE_OP').AsInteger := varToInt(src.Dataset['OPERATION_TYPE_SID'],0);

         sqlWagonRePosition.ParamByName('P_CHAIN').AsInteger := destID;
         sqlWagonRePosition.ParamByName('P_LOCOMOTIVE_SID').AsInteger  := locomotiveID;

         // определяем параметры вывода для выгрузки/поргузки
         sqlWagonRePosition.ParamByName('P_MODE_MAKE_CLAIM').AsInteger := 0;
         sqlWagonRePosition.ParamByName('P_MODE_TEMP_OUTPUT').AsInteger := 0;
         sqlWagonRePosition.ParamByName('P_ANCESTOR_PLACE_ID').AsInteger := 0;

         sqlWagonRePosition.ParamByName('P_ADD_DISLOCATION_REASON').AsString := ''; //varToStr(src.Dataset['ADD_DISLOCATION_REASON']);

         flowTypeOp := varToInt(src.Dataset['ANCESTOR_TYPE_SID'],0);

         if flowTypeOp = 0 then
            flowTypeOp := varToInt(src.Dataset['OPERATION_TYPE_SID'],0);

         if not tempOutput(src.Dataset) then begin
            if (flowTypeOp = OP_SHIPMENT) or (flowTypeOp = OP_UNSHIPMENT) then begin
               sqlWagonRePosition.ParamByName('P_MODE_TEMP_OUTPUT').AsInteger := 2;
               sqlWagonRePosition.ParamByName('P_NOTE').AsString := 'rePosition Постоянный вывод';
               if VarToDate(src.Dataset['F_OUT_CLAIM_DATE']) = 0 then
                  sqlWagonRePosition.ParamByName('P_MODE_MAKE_CLAIM').AsInteger := 1;
            end;
            if flowTypeOp = OP_SHIPMENT then
                if ((src.tag <> BUFFER_PLACE) and (placeAbility[srcTag].cbTempOutput.Visible and placeAbility[srcTag].cbTempOutput.Checked)) then begin
                  sqlWagonRePosition.ParamByName('P_MODE_TEMP_OUTPUT').AsInteger := 1;
                  sqlWagonRePosition.ParamByName('P_MODE_MAKE_CLAIM').AsInteger := 0;
                  sqlWagonRePosition.ParamByName('P_NOTE').AsString := 'rePosition Временный вывод';
                end;
         end else begin
            // возврат вагона в цех после временного вывода или произвольные перемещения
            sqlWagonRePosition.ParamByName('P_ANCESTOR_PLACE_ID').AsInteger := varToInt(src.Dataset['ANCESTOR_PLACE_ID'],0);
            sqlWagonRePosition.ParamByName('P_NOTE').AsString := 'rePosition Возврат вагона в цех';
         end;

         sqlWagonRePosition.Execute;

         msg := '';
         case sqlWagonRePosition.ParamByName('P_ERR_OP_CLIENT').AsInteger of    //
           -1: msg := 'Прямое перемещение между клиентскими точками запрещено';
           -2: msg := 'Все возможные клиентские операции (2900006, 2900016) уже выполнены';
           -3: msg := 'Вагон ' + IntToStr(src.Dataset['WAGON_NO']) + ' был выведен из другого цеха. Операция не создана';
         end;

         if msg = '' then begin
            msg := trim(sqlWagonRePosition.ParamByName('P_RESULT').AsString);
            if msg <> '' then begin
               umessages.Error(msg);
               sqlWagonRePosition.Session.Rollback;
               continue;
            end;
            //else sqlWagonRePosition.Session.Commit;
         end;

         if msg <> '' then begin umessages.Error(msg);  continue;  end;

         if srcTag <> BUFFER_PLACE then
            hash_sour_after := getHash(placeAbility[srcTag].L_PLACE_STR_ID, now());
         hash_dest_after := getHash(placeAbility[dst.tag].L_PLACE_STR_ID, now());

         if srcTag <> BUFFER_PLACE then
            placeAbility[srcTag].hash := hash_sour_after;
         placeAbility[dst.tag].hash := hash_dest_after;

         if rgInsertMode.ItemIndex in [1,2] then // вставка в середину или голову
            destID := sqlWagonRePosition.ParamByName('P_ID_NEW_OP').AsInteger;

         rollbackProcess(externalRePosition,
             placeAbility[srcTag].L_PLACE_STR_ID,placeAbility[dst.tag].L_PLACE_STR_ID,srcTag,dst.tag,
             hash_sour_before + ':' + hash_sour_after,
             hash_dest_before + ':' + hash_dest_after,
             sqlWagonRePosition.ParamByName('P_ID_NEW_OP').AsString
             );

         addToString(placeAbility[dst.tag].freshRepositionListID, sqlWagonRePosition.ParamByName('P_ID_NEW_OP').AsString, ',');
         addToString(listMovedWagon, VarToStr(src.Dataset['RW_WAGON_OPER_ID']), ',');
         upd := true;
     end;

//     LockWindowUpdate(src.Handle);
//     LockWindowUpdate(dst.Handle);


     if upd then begin
        src.dgrBrowse.MSelectedRows.Clear;
        if (src.tag = BUFFER_PLACE) and (listMovedWagon <> '') then begin
          // удалим из буфера перемещенные вагоны
           BrowseRefParams.Session.ExecSQL('delete from tmp_cache_table where objID in (' + listMovedWagon +
              ') and var1 = ' + IntToStr(frSelectedList_2.tag),[]);
           BrowseRefParams.Session.Commit;
           reOpenQuery(quPlace_4);
        end else begin
           UpdateQuery_Place(src.tag);
           if placeAbility[src.tag].cbTempOutput.Checked then placeAbility[src.tag].cbTempOutput.Checked := false;
        end;
        if dst.tag <> src.tag then
           UpdateQuery_Place(dst.tag);
        rollbackProcess(nextStep);
     end;
  end;

  //restoreSelection(dst, listSelectedID + ',' + placeAbility[dst.tag].freshRepositionListID, dstSaveFlowID);
  // Кузнецова Т.В. 20150622: надо убрать автоотметку перенесенных вагонов

  restoreSelection(dst, listSelectedID, dstSaveFlowID);
  if listDenyWagonOpID <> '' then
     restoreSelection(src.dgrBrowse, listDenyWagonOpID, srcSaveFlowID);

  LockWindowUpdate(0);
end;

procedure TfmRwWagonDislocationEx.frPlace_1dgrBrowseDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  rePosition(Sender, Source, X, Y);
end;

procedure TfmRwWagonDislocationEx.rgOperationModeClick(Sender: TObject);
begin
  inherited;
    If F_UpdateMode = 0 then Exit;

    F_FULL_REOPEN := 1;
    F_LIMIT_UNI_PLACES:=0;
    UpdateQueryDislocationPlaces();
    F_FULL_REOPEN := 0;
    F_LIMIT_UNI_PLACES:=0;
    if Visible=True then
       frShptPlaces.dsBrowse.DataSet.First;
end;

procedure TfmRwWagonDislocationEx.rbSelectPlace_1CleanButtonClick(
  Sender: TObject);
begin
  inherited;
  //UnLockShptPlace(placeAbility[(Sender as TMalRefButton).tag].L_PLACE_STR_ID);
  ClearPlaceValues((Sender as TMalRefButton).tag);
end;

procedure TfmRwWagonDislocationEx.rbSelectPlace_2CleanButtonClick(
  Sender: TObject);
begin
  inherited;
  rbSelectPlace_1CleanButtonClick(Sender);
end;

procedure TfmRwWagonDislocationEx.rbSelectPlace_3CleanButtonClick(
  Sender: TObject);
begin
  inherited;
  rbSelectPlace_1CleanButtonClick(Sender);
end;

procedure TfmRwWagonDislocationEx.rbSelectPlace_1BrowseButtonClick(
  Sender: TObject);
var
  i, tag, Loc_ID : Integer;
begin
  inherited;
    BrowseRefParams.BrowseOptionSet := [boSelect];
    iunsirw.SelectCommonShptPlaces(browseRefParams, 1, Def_GDC_CODE, 0);

    if BrowseRefParams.SDIResult<>mrOk then exit;

    Loc_ID := VarToInt(BrowseRefParams.DataSet['PLACE_STR_ID'], 0);

    for i := 1 to 3 do begin
      if placeAbility[i].L_PLACE_STR_ID <> Loc_ID then continue;
      umessages.Error('Этот участок уже был выбран ранее');
      exit;
    end;
    tag := (Sender as TMalRefButton).tag;

    SetPlaceDSL(tag, Loc_ID);

    UpdateQuery_Place(tag);

    placeAbility[(Sender as TMalRefButton).tag].frPlace.dgrBrowse.MSelectedRows.Clear;
    placeAbility[(Sender as TMalRefButton).tag].lblSelected.Caption := '';
end;

procedure TfmRwWagonDislocationEx.rbSelectPlace_2BrowseButtonClick(
  Sender: TObject);
begin
  inherited;
  rbSelectPlace_1BrowseButtonClick(Sender);
end;

procedure TfmRwWagonDislocationEx.rbSelectPlace_3BrowseButtonClick(
  Sender: TObject);
begin
  inherited;
  rbSelectPlace_1BrowseButtonClick(Sender);
end;

procedure TfmRwWagonDislocationEx.frBrowseRwWagonListdsBrowseDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if not self.Visible then EXIT;
  if ModalResult = mrCancel then EXIT;

  if F_FULL_REOPEN = 1 then EXIT;
  if F_UpdateMode = 0 then EXIT;

  frBrowseRwWagonList.dsBrowseDataChange(Sender, Field);

  frRwWagonOperationShow.quRwWagonOperation.Close();
  frRwWagonOperationShow.quRwWagonOperation.ParamByName('P_ID').Value := VarToInt(quSelectRwWagonList['Rw_Wagon_List_Id']);
  frRwWagonOperationShow.quRwWagonOperation.Open();

  frRwWagonOperationShow.UpdateActionStatus;
end;

procedure TfmRwWagonDislocationEx.frShptPlacesdsBrowseDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
    if not Self.Visible then EXIT;
    if modalResult=mrOk then EXIT;

  if cbShowAllWagons.Checked=True then
     Exit;

  if F_UpdateMode=0 then
     Exit;

  if F_FULL_REOPEN=1 then
      Exit;

  frShptPlaces.dsBrowseDataChange(Sender, Field);

  F_LIMIT_UNI_PLACES:=0;

  if (VarToInt(frShptPlaces.dsBrowse.DataSet['WAGON_COUNT'],0)=0) and (VarToInt(frShptPlaces.dsBrowse.DataSet['PLACE_STR_ID'],0)>0) then
      quSelectRwWagonList.close
  else
    if F_FULL_REOPEN=0 then
       ReopenMainQuery();

end;

procedure TfmRwWagonDislocationEx.quSelectPlacesAfterOpen(
  DataSet: TDataSet);
//var i : Integer;
begin
  inherited;
   (quSelectPlaces.FieldByName('WAGON_COUNT') as TNumericField).DisplayFormat := ',0;-,0;#';
end;

procedure TfmRwWagonDislocationEx.cbShowAllWagonsClick(Sender: TObject);
begin
  inherited;
    if not Self.Visible then EXIT;
    if modalResult=mrOk then EXIT;
    If F_UpdateMode = 0 then Exit;

    F_FULL_REOPEN:=1;
    F_LIMIT_UNI_PLACES:=0; // тут не нужно переделывать список мест дислокации
    ReopenMainQuery();
    F_FULL_REOPEN:=0;
    F_LIMIT_UNI_PLACES:=0;

    if cbShowAllWagons.Checked=False then   begin
         frShptPlaces.dgrBrowse.SetFocus;
         frShptPlaces.dsBrowse.DataSet.Next;
    end;
end;

procedure TfmRwWagonDislocationEx.frPlace_1dgrBrowseSelectRecord(
  Sender: TObject; const SelectRow: Boolean);
var src: TMalDBGrid;
var offset: integer;
var theory: double;
begin
  inherited;

  src := (Sender as TMalDBGrid);
  placeAbility[src.tag].lblSelected.Caption := IntToStr(src.MSelectedRows.Count);

  if src.MSelectedRows.Count <= 0 then exit;

  placeAbility[src.tag].frPlace.EndDrag(true);

///
  try
     LockWindowUpdate(src.Handle);
  except
     exit;
  end;

   offset := -1;
   if not src.DataSource.DataSet.IsEmpty then
      offset := src.DataSource.DataSet.RecNo - src.Row;

   src.DataSource.DataSet.first;
   theory := 0;
   placeAbility[src.tag].selectOperList.Clear;
   while not src.DataSource.DataSet.Eof do begin
     if src.MSelectedRows.CurrentRowSelected then begin
        theory := theory + VarToFloat(src.DataSource.Dataset['Wagons_Teory'], 0);
        placeAbility[src.tag].selectOperList.Add(src.DataSource.DataSet.FieldByName('RW_WAGON_OPER_ID').AsString);
     end;
     src.DataSource.DataSet.Next;
   end;

   if offset <> -1 then begin
     src.DataSource.DataSet.first;
     while not src.DataSource.DataSet.Eof do begin
        if offset = src.DataSource.DataSet.RecNo - src.Row then
           break;
        src.DataSource.DataSet.Next;
     end;
   end;

   LockWindowUpdate(0);
///

{
  try
     LockWindowUpdate(src.Handle);
  except
     exit;
  end;


  flowID := -1;
  if not src.DataSource.DataSet.IsEmpty then
     flowID := src.DataSource.DataSet['RW_WAGON_OPER_ID'];

  theory := 0;
  placeAbility[src.tag].selectOperList.Clear;
  for i := 0 to src.MSelectedRows.Count-1 do begin
      src.DataSource.DataSet.GotoBookmark(pointer(src.MSelectedRows.Items[i]));
      theory := theory + VarToFloat(src.DataSource.Dataset['Wagons_Teory'], 0);
      placeAbility[src.tag].selectOperList.Add(src.DataSource.DataSet.FieldByName('RW_WAGON_OPER_ID').AsString);
  end;

  restoreSelection(src, '', flowID);
  LockWindowUpdate(0);
 }
  placeAbility[src.tag].lblSelected.Caption := placeAbility[src.tag].lblSelected.Caption
           + ' (' + FloatToStr(theory) + ')';

end;

procedure TfmRwWagonDislocationEx.frSelectedList_2dgrBrowseDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var src: TfrSDIBrowse;
var dst: TMalDBGrid;
var i: integer;
begin
  inherited;

  if cbBufferMode.Text <> bufferMode[0] then begin
     umessages.Information('Для ручного заполнения буфера выберите режим <' + bufferMode[0] + '>');
     exit;
  end;

  if not((Sender.ClassName = 'TMalDBGrid') and (Source.ClassName = 'TfrSDIBrowse')) then exit;
  src := (Source as TfrSDIBrowse);
  if (src.dgrBrowse.MSelectedRows.Count = 0) or (not (src.Tag in [1,2,3])) then exit;

  dst := (Sender as TMalDBGrid);

  for i := 0 to src.dgrBrowse.MSelectedRows.Count-1 do begin
      src.DataSet.GotoBookmark(pointer(src.dgrBrowse.MSelectedRows.Items[i]));
      LSession.ExecSQL('insert into tmp_cache_table (taskID, objID, flag, var1, var2, str1) '+
                                             'select taskID, objID, flag, :grd, var2, str1 '+
                'from tmp_cache_table where taskID = cache.getTaskID(''DSL'') and objID = :objID',
                      [dst.tag, VarToInt(src.dsBrowse.Dataset['RW_WAGON_OPER_ID'],0)]);
      LSession.Commit;
  end;
  src.dgrBrowse.MSelectedRows.Clear();

  // обновим грид источника
  reOpenQuery(placeAbility[src.Tag].quPlace);

  // обновим грид приемника
  quPlace_4.close;
  quSelectMainPlaceLight.ParamByName('P_GRID_NUMBER').AsInteger := dst.tag;
  quPlace_4.MacroByName('MainSql').Value := quSelectMainPlaceLight.FinalSQL;
  quPlace_4.Params := quSelectMainPlaceLight.Params;
  quPlace_4.open;
  frSelectedList_2.acRefreshExecute(Sender);
end;

procedure TfmRwWagonDislocationEx.frSelectedList_2dgrBrowseDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := True;
end;

procedure TfmRwWagonDislocationEx.frSelectedList_2dgrBrowseMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if not ((mbLeft = Button) and (not frSelectedList_2.DataSet.IsEmpty)) then Exit;
  if frSelectedList_2.dgrBrowse.MSelectedRows.Count>0 then
     frSelectedList_2.BeginDrag(False);
end;

procedure TfmRwWagonDislocationEx.frSelectedList_2acViewCardExecute(
  Sender: TObject);
begin
  if VarToInt(frSelectedList_2.dsBrowse.DataSet['Rw_Wagon_oper_ID'],0)<>0 then
     RwWagonOperationCard( BrowseRefParams.session,
                           VarToInt(frSelectedList_2.dsBrowse.DataSet['Rw_Wagon_oper_ID'],0),
                           VarToInt(frSelectedList_2.dsBrowse.DataSet['Rw_Wagon_List_ID'],0),
                           cmView,
                           VarToInt(frSelectedList_2.dsBrowse.DataSet['Operation_Type_SID'],0),
                           Nil
                          );
end;

procedure TfmRwWagonDislocationEx.cbWagonExistOnlyClick(Sender: TObject);
begin
  inherited;
    if not Self.Visible then EXIT;
    if modalResult=mrOk then EXIT;

    F_FuLL_REOPEN := 1;
    UpdateQueryDislocationPlaces();
    F_FuLL_REOPEN := 0;
    if Visible=True then
       frShptPlaces.dsBrowse.DataSet.First;
end;

procedure TfmRwWagonDislocationEx.rbSignForSHPTCleanButtonClick(
  Sender: TObject);
begin
  inherited;
  LOC_FOR_SHPT_PLACE_ID :=0;
  laForSHptSign.Caption := '';
end;

procedure TfmRwWagonDislocationEx.rbSignForSHPTBrowseButtonClick(
  Sender: TObject);
begin
  inherited;
    BrowseRefParams.BrowseOptionSet := [boSelect];
    iunsirw.SelectShptPlace(BrowseRefParams,1,0);
    if BrowseRefParams.SDIResult=mrOK then begin
         LOC_FOR_SHPT_PLACE_ID := VarToInt(BrowseRefParams.DataSet['SHPT_PLACE_ID'],0);
         LOC_FOR_SHPT_PLACE_STR_ID := 0;
         LOC_FOR_SHPT_PLACE_STR_NO := 0;
         laForSHptSign.Caption := VarToSTR(BrowseRefParams.DataSet['NAME']);;
    end;
end;

procedure TfmRwWagonDislocationEx.btSetForShptSignClick(Sender: TObject);
begin
  inherited;
    MakeOperationSignFormShpt(1);
end;

procedure TfmRwWagonDislocationEx.btClearForShptSignClick(Sender: TObject);
begin
  inherited;
    MakeOperationSignFormShpt(2);
end;

procedure TfmRwWagonDislocationEx.MakeOperationSignFormShpt(aMode:Integer);
var
  i : Integer;
begin

    if (frPlace_1.dgrBrowse.MSelectedRows.Count=0) and  (frPlace_2.dgrBrowse.MSelectedRows.Count=0)
       and  (frPlace_3.dgrBrowse.MSelectedRows.Count=0)  and (frSelectedList_2.dgrBrowse.MSelectedRows.Count=0)
    then
       begin
         umessages.Error('Не выбрано ни одного вагона для проведения разметки');
         Exit;
       end;

    if (Loc_FOR_SHPT_PLACE_ID=0) and (aMode=1) then
       begin
         umessages.Error('Не выбрано место для разметки вагонов под погрузку');
         Exit;
       end;

      LSession.ExecSQL('Delete from Tmp_ID',[]);
      LSession.Commit;

      with frPlace_1 do
        if dgrBrowse.MSelectedRows.Count > 0 then
           begin
              for I := 0 to dgrBrowse.MSelectedRows.Count - 1 do
              begin
                DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));

               // Проверим разметку на вагоне, возможности подачи под погрузку
                if VarToInt(dsBrowse.Dataset['F_ALLOW_FOR_SHPT'],0) <= 0 then
                   umessages.Error('Вагон ' + VarToStr(dsBrowse.Dataset['WAGON_NO']) + ' не размечен как возможный к подаче под погрузку');
                   if VarToInt(dsBrowse.Dataset['F_ALLOW_FOR_SHPT'],0) > 0 then
                   begin
                     sqlInsertIntoTmpID.ParamByName('P_ID').AsInteger:=VarToInt(dsBrowse.Dataset['RW_WAGON_LIST_ID'],0);
                     sqlInsertIntoTmpID.Execute;
                   end;
              end;
              dgrBrowse.MSelectedRows.Clear();
              sqlInsertIntoTmpID.Session.Commit;
           end;

      with frPlace_2 do
        if dgrBrowse.MSelectedRows.Count > 0 then
           begin
              for I := 0 to dgrBrowse.MSelectedRows.Count - 1 do
              begin
                DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));

               // Проверим разметку на вагоне, возможности подачи под погрузку
                if VarToInt(dsBrowse.Dataset['F_ALLOW_FOR_SHPT'],0) <= 0 then
                   umessages.Error('Вагон ' + VarToStr(dsBrowse.Dataset['WAGON_NO']) + ' не размечен как возможный к подаче под погрузку');
                   if VarToInt(dsBrowse.Dataset['F_ALLOW_FOR_SHPT'],0) > 0 then
                   begin
                     sqlInsertIntoTmpID.ParamByName('P_ID').AsInteger:=VarToInt(dsBrowse.Dataset['RW_WAGON_LIST_ID'],0);
                     sqlInsertIntoTmpID.Execute;
                   end;

              end;
              dgrBrowse.MSelectedRows.Clear();
              sqlInsertIntoTmpID.Session.Commit;
           end;

      with frPlace_3 do
        if dgrBrowse.MSelectedRows.Count > 0 then
           begin
              for I := 0 to dgrBrowse.MSelectedRows.Count - 1 do
              begin
                DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));

               // Проверим разметку на вагоне, возможности подачи под погрузку
                if VarToInt(dsBrowse.Dataset['F_ALLOW_FOR_SHPT'],0) <= 0 then
                   umessages.Error('Вагон ' + VarToStr(dsBrowse.Dataset['WAGON_NO']) + ' не размечен как возможный к подаче под погрузку');
                   if VarToInt(dsBrowse.Dataset['F_ALLOW_FOR_SHPT'],0) > 0 then
                   begin
                     sqlInsertIntoTmpID.ParamByName('P_ID').AsInteger:=VarToInt(dsBrowse.Dataset['RW_WAGON_LIST_ID'],0);
                     sqlInsertIntoTmpID.Execute;
                   end;

              end;
              dgrBrowse.MSelectedRows.Clear();
              sqlInsertIntoTmpID.Session.Commit;
           end;

      with frSelectedList_2 do
        if dgrBrowse.MSelectedRows.Count > 0 then
           begin
              for I := 0 to dgrBrowse.MSelectedRows.Count - 1 do
              begin
                DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));

                sqlInsertIntoTmpID.ParamByName('P_ID').AsInteger:=VarToInt(dsBrowse.Dataset['RW_WAGON_LIST_ID'],0);
                sqlInsertIntoTmpID.Execute;

              end;
              dgrBrowse.MSelectedRows.Clear();
              sqlInsertIntoTmpID.Session.Commit;
           end;


       sqlMakeSignForShpt.Session := Lsession;
       if Amode=1 then
          begin
            sqlMakeSignForShpt.ParamByName('P_SHPT_PLACE_ID').AsInteger     := LOC_FOR_SHPT_PLACE_ID;
            sqlMakeSignForShpt.ParamByName('P_SHPT_PLACE_STR_ID').AsInteger := LOC_FOR_SHPT_PLACE_STR_ID;
            sqlMakeSignForShpt.ParamByName('P_SHPT_PLACE_STR_NO').AsInteger := LOC_FOR_SHPT_PLACE_STR_NO;
          end;

       if Amode=2 then
          begin
            sqlMakeSignForShpt.ParamByName('P_SHPT_PLACE_ID').AsInteger     := -1;
            sqlMakeSignForShpt.ParamByName('P_SHPT_PLACE_STR_ID').AsInteger := -1;
            sqlMakeSignForShpt.ParamByName('P_SHPT_PLACE_STR_NO').AsInteger := -1;
          end;

       sqlMakeSignForShpt.Execute;
       sqlMakeSignForShpt.Session.Commit;

       uMessages.Information('Процедура успешно завершена');

       UpdateAll_QueryPlaces();
end;

procedure showCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState; src: TfrSDIBrowse);
begin
  with src do
   if not (gdSelected in State) then
   begin

     if ( DataSet['DEPART_TECH_COND_SID'] = 32400001 )         // больные
     and ( Column.FieldName = 'DEPART_TECH_COND_NAME' ) then
        begin
          AFont.Style := [fsBold];
          AFont.Color := clRed;
        end;

   if ( DataSet['DEPART_TECH_COND_SID'] = 32400001 )         // больные
   and ( Column.FieldName = 'DEPART_TECH_COND_SHORT_NAME' ) then
        begin
          AFont.Style := [fsBold];
          AFont.Color := clRed;
        end;

     if ( DataSet['CARGO_EXIST_DEPART_SID'] = 32500001 )    // порожние
     and ( Column.FieldName = 'CARGO_EXIST_DEPART_NAME' ) then
        AFont.Color := clRed;

     if ( DataSet['CARGO_EXIST_DEPART_SID'] = 32500002 )     //  груженые
     and ( Column.FieldName = 'CARGO_EXIST_DEPART_NAME' ) then
        AFont.Style := [fsBold];

     if ( DataSet['SHPT_STATUS_STR']='ГРУ'  )     //  груженые по погрузке
     and ( Column.FieldName = 'SHPT_STATUS_STR' ) then
        begin
          AFont.Style := [fsBold];
          AFont.Color := clRed;
        end;

     if ( VarToStr(DataSet['COLOR_MARK'])<>'' )                // собственные вагоны
     and ( Column.FieldName = 'WAGON_NO' ) then
        begin
           AFont.Color := clBlack;
           If VarToStr(DataSet['COLOR_MARK'])='clYellow'  then Background := clYellow;
           If VarToStr(DataSet['COLOR_MARK'])='clLime'    then Background := clLime;
           If VarToStr(DataSet['COLOR_MARK'])='clAqua'    then Background := clAqua;
           If VarToStr(DataSet['COLOR_MARK'])='clRed'     then Background := clRed;
           If VarToStr(DataSet['COLOR_MARK'])='clFuchsia' then Background := clFuchsia;
        end;

      if (Column.FieldName = 'TRAIN_NUMBER') or (Column.FieldName = 'LOCAL_ORDER_IN_TRAIN_HEAD') then
        if placeAbility[src.tag].trainList.IndexOf(VarToStr(Dataset['train_number'])) mod 2 = 0 then
           Background := clWindow
        else
           Background := cl3DLight;

      if pos(',' + VarToStr(Dataset['RW_WAGON_OPER_ID']) + ',',  ',' + placeAbility[src.tag].freshRepositionListID + ',') > 0 then
         Background := clSkyBlue;

      if pos(',' + VarToStr(Dataset['RW_WAGON_LIST_ID']) + ',',  ',' + placeAbility[src.tag].foundListID + ',') > 0 then
         Background := clMoneyGreen;

      if DataSet['FUTURE_OPER_EXISTS'] = 1   then    // недоступен (есть операции в будущем)
         Background := clGray;

     if ( VarToInt(DataSet['DAYS_REPAIR'],0) <= 30 )   // дней до капремонта
     and ( Column.FieldName = 'DAYS_REPAIR' ) then
        begin
          AFont.Color := clRed;
          Afont.Size  := 9;
          AFont.Style := [fsBold];
        end;


   end;

end;

procedure TfmRwWagonDislocationEx.frPlace_1dgrBrowseGetCellParams(
  Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  showCellParams(Sender,Column,AFont,Background,State,frPlace_1);
end;

procedure TfmRwWagonDislocationEx.frPlace_2dgrBrowseGetCellParams(
  Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  showCellParams(Sender,Column,AFont,Background,State,frPlace_2);
end;

procedure TfmRwWagonDislocationEx.frPlace_3dgrBrowseGetCellParams(
  Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  showCellParams(Sender,Column,AFont,Background,State,frPlace_3);
end;

procedure TfmRwWagonDislocationEx.showOperation(BrowseRefParams: TBrowseRefParams; src: TfrSDIBrowse; aCardMode: TCardMode = cmEdit);
var operID:  integer;
var typeSID: integer;
var i: integer;
var hash: array[1..3] of string;
var ModalResult    : TModalResult;
begin
    wasShowOperation := true;
    src.EndDrag(true);

    operID  := VarToInt(src.dsBrowse.DataSet['Rw_Wagon_oper_ID'],0);
    if operID = 0 then exit;

    typeSID := VarToInt(src.dsBrowse.DataSet['Operation_Type_SID'],0);

    if aCardMode = cmView then begin // режим просмотра: просто показываем и уходим.
      RwWagonOperationCard( BrowseRefParams.session,
             operID, VarToInt(src.dsBrowse.DataSet['Rw_Wagon_List_ID'],0),
             aCardMode, typeSID, nil );
      exit;
    end;

    // режим редактирования
    if placeAbility[src.Tag].PlaceIsLocked then begin
       placeAbility[src.Tag].PlaceIsLocked := PlaceIsLocked(src.Tag, true);
       if placeAbility[src.Tag].PlaceIsLocked then exit;
       placeAbility[src.Tag].lblPlace.Caption := placeAbility[src.Tag].laPlaceName;
    end;

    if VarToInt(src.dsBrowse.DataSet['nested_level'],0) <> 0 then begin
       if (VarToInt(src.dsBrowse.DataSet['ANCESTOR_ID'],0) > 0) and
          (VarToInt(src.dsBrowse.DataSet['ANCESTOR_TYPE_SID'],0) > 0) then begin
            operID  := VarToInt(src.dsBrowse.DataSet['ANCESTOR_ID'],0);
            typeSID := VarToInt(src.dsBrowse.DataSet['ANCESTOR_TYPE_SID'],0);
       end;
    end;

   // запомним хеши всех точек перед выполением операции
   for i := 1 to Length(placeAbility) do
      hash[i] := getHash(placeAbility[i].L_PLACE_STR_ID, now());

   ModalResult := RwWagonOperationCard( BrowseRefParams.session,
                         operID, VarToInt(src.dsBrowse.DataSet['Rw_Wagon_List_ID'],0),
                         aCardMode, typeSID, nil );

   if (ModalResult = mrOk) and (typeSID = 2900001) then
      UpdateQuery_Place(src.Tag);

   // проверим хеши всех точек после выполением операции
   for i := 1 to Length(placeAbility) do
      if hash[i] <> getHash(placeAbility[i].L_PLACE_STR_ID, now()) then
         UpdateQuery_Place(i);

end;

procedure TfmRwWagonDislocationEx.frPlace_1acEditExecute(Sender: TObject);
begin
  showOperation(BrowseRefParams, ((Sender as TComponent).Owner as TfrSDIBrowse));
end;

procedure TfmRwWagonDislocationEx.frPlace_2acEditExecute(Sender: TObject);
begin  frPlace_1acEditExecute(Sender) end;

procedure TfmRwWagonDislocationEx.frPlace_3acEditExecute(Sender: TObject);
begin  frPlace_1acEditExecute(Sender) end;

procedure TfmRwWagonDislocationEx.frPlace_1acDeleteExecute(
  Sender: TObject);
var src: TfrSDIBrowse;
var typeSID: integer;
begin
  inherited;

  src := ((Sender as TComponent).Owner as TfrSDIBrowse);
  typeSID := VarToInt(src.dsBrowse.DataSet['Operation_Type_SID'],0);
  if typeSID <> 2900001 then begin
     umessages.Error('Удалять можно только маневровые операции');
     exit;
  end;

  RwWagonOperationCard( BrowseRefParams.session,
                        VarToInt(src.dsBrowse.DataSet['Rw_Wagon_oper_ID'],0),
                        VarToInt(src.dsBrowse.DataSet['Rw_Wagon_List_ID'],0),
                        cmDelete, typeSID, nil );

  UpdateQuery_Place(src.tag);
  LockReleasePlace(src.tag);
end;

procedure TfmRwWagonDislocationEx.frPlace_2acDeleteExecute(
  Sender: TObject);
begin
  frPlace_1acDeleteExecute(Sender);
end;

procedure TfmRwWagonDislocationEx.frPlace_3acDeleteExecute(
  Sender: TObject);
begin
  frPlace_1acDeleteExecute(Sender);
end;

procedure TfmRwWagonDislocationEx.frSelectedList_2dgrBrowseSelectRecord(
  Sender: TObject; const SelectRow: Boolean);
begin
  inherited;
    L_PLACE_WS_SELECTED   := frSelectedList_2.dgrBrowse.MSelectedRows.Count;
    laSelected_WS.Caption := 'Отмечено: ' + IntToStr(L_PLACE_WS_SELECTED);
end;

procedure TfmRwWagonDislocationEx.frSelectedListdgrBrowseSelectRecord(
  Sender: TObject; const SelectRow: Boolean);
begin
  inherited;
    L_PLACE_WS_2_SELECTED   := frSelectedList.dgrBrowse.MSelectedRows.Count;
    laSelected_WS_2.Caption := IntToStr(L_PLACE_WS_2_SELECTED);
end;

procedure TfmRwWagonDislocationEx.quPlace_1AfterOpen(DataSet: TDataSet);
var i: Integer;
    placeID: Integer;
    frPlace: TfrSDIBrowse;
    trainNumber: string;
begin
  inherited;
   for i:= 0 to TMalOraQuery(DataSet).Fields.Count - 1 do begin
      if UpperCase(TMalOraQuery(DataSet).Fields[i].FieldName) = 'F_OUT_CLAIM_DATE' then
         TTimeField(TMalOraQuery(DataSet).Fields[i]).DisplayFormat:= 'dd.mm.yy  hh:nn';
      TMalOraQuery(DataSet).Fields[i].ReadOnly := true;
      if UpperCase(TMalOraQuery(DataSet).Fields[i].FieldName) = 'ADD_DISLOCATION_NOTE' then
         TMalOraQuery(DataSet).Fields[i].ReadOnly := false;
      if UpperCase(TMalOraQuery(DataSet).Fields[i].FieldName) = 'ADD_DISLOCATION_REASON' then
         TMalOraQuery(DataSet).Fields[i].ReadOnly := false;

    end;

// !!!!!!!!!!!!!!!!!!!!!
//    frPlace: TfrSDIBrowse;
    placeID := TMalOraQuery(DataSet).tag;
    frPlace := placeAbility[placeID].frPlace;
    LockWindowUpdate(frPlace.Handle);
    placeAbility[placeID].trainList.Clear;

    DataSet.first;
    while not DataSet.Eof do begin
      trainNumber := VarToStr(Dataset['train_number']);
      if placeAbility[placeID].trainList.IndexOf(trainNumber) < 0 then
         placeAbility[placeID].trainList.add(trainNumber);
      DataSet.Next;
    end;
  LockWindowUpdate(0);

end;
  {
procedure TfmRwWagonDislocationEx.quPlace_2AfterOpen(DataSet: TDataSet);
var i: Integer;
begin
  inherited;
   for i:= 0 to TMalOraQuery(DataSet).Fields.Count - 1 do
    begin
      if UpperCase(TMalOraQuery(DataSet).Fields[i].FieldName) = 'F_OUT_CLAIM_DATE' then
         TTimeField(TMalOraQuery(DataSet).Fields[i]).DisplayFormat:= 'dd.mm.yy  hh:nn';
    end;
end;

procedure TfmRwWagonDislocationEx.quPlace_3AfterOpen(DataSet: TDataSet);
var i: Integer;
begin
  inherited;
   for i:= 0 to TMalOraQuery(DataSet).Fields.Count - 1 do
    begin
      if UpperCase(TMalOraQuery(DataSet).Fields[i].FieldName) = 'F_OUT_CLAIM_DATE' then
         TTimeField(TMalOraQuery(DataSet).Fields[i]).DisplayFormat:= 'dd.mm.yy  hh:nn';
    end;
end;
   }

procedure TfmRwWagonDislocationEx.cbShowByAllPlaceStrClick(
  Sender: TObject);
begin
  inherited;
    if not Self.Visible then EXIT;
    if modalResult=mrOk then EXIT;
    If F_UpdateMode = 0 then Exit;

    F_Full_REOPEN :=1;

{    if cbShowByAllPlaceStr.Checked=True then
       F_LIMIT_UNI_PLACES:=0
    else
       F_LIMIT_UNI_PLACES:=1;
}

    F_LIMIT_UNI_PLACES:=0;
    F_UpdateMode := 0;
    If cbShowAllWagons.Checked=True then
       cbShowAllWagons.Checked := False;

    UpdateQueryDislocationPlaces();

    F_Full_REOPEN :=0;
    F_LIMIT_UNI_PLACES:=0;
    F_UpdateMode:= 1;

end;

procedure TfmRwWagonDislocationEx.rbCargoGrpCleanButtonClick(
  Sender: TObject);
begin
  inherited;
     Loc_CargoGroupID := 0;
     laCargoGroup.Caption := '';
     F_FULL_REOPEN:=1;
     F_LIMIT_UNI_PLACES:=1;
     ReopenMainQuery();
     UpdateAll_QueryPlaces();
     F_FULL_REOPEN:=0;
     F_LIMIT_UNI_PLACES:=0;
end;

procedure TfmRwWagonDislocationEx.rbCargoGrpBrowseButtonClick(
  Sender: TObject);
begin
  inherited;
    BrowseRefParams.BrowseOptionSet := [boSelect];
    BrowseRefParams.DatePeriod.EndDate := Date();
    iunsi.SelectService(BrowseRefParams,260);
    if BrowseRefParams.SDIResult = mrOK then
    begin
      Loc_CargoGroupID     := VarToInt(BrowseRefParams.DataSet['SERVICE_ID'],0);
      laCargoGroup.Caption := VarToStr(BrowseRefParams.DataSet['NAME']);
      F_FULL_REOPEN:=1;
      F_LIMIT_UNI_PLACES:=1;
      ReopenMainQuery();
      UpdateAll_QueryPlaces();
      F_FULL_REOPEN:=0;
      F_LIMIT_UNI_PLACES:=0;
    end;
end;

procedure TfmRwWagonDislocationEx.rbRailWaysCleanButtonClick(
  Sender: TObject);
begin
  inherited;
    Rw_Str := '';
    Update_Local_QueryPlaces();
end;

procedure TfmRwWagonDislocationEx.rbRailWaysBrowseButtonClick(
  Sender: TObject);
begin
  inherited;

  Rw_Str      := '';
  Rw_Str_NAME := '';

  BrowseRefParams.BrowseOptionSet := [boSelect, boMultiSelect];
  SelectRailWay(BrowseRefParams);
  if BrowseRefParams.SDIResult = mrOK then
     begin
        BrowseRefParams.DataSet.First();
        if VarToInt(BrowseRefParams.DataSet['RailWay_ID'],0)<>0 then
           begin
             Rw_Str      := VarToStr(BrowseRefParams.DataSet['RailWay_ID']);
             Rw_Str_NAME := VarToStr(BrowseRefParams.DataSet['SHORT_NAME']);
           end;

        while not BrowseRefParams.DataSet.Eof do
        begin
           if VarToInt(BrowseRefParams.DataSet['RailWay_ID'],0)<>0 then
              begin
                 Rw_Str := Rw_Str + ',' + VarToStr(BrowseRefParams.DataSet['RailWay_ID']);
                 Rw_Str_NAME := Rw_Str_NAME + ',' + VarToStr(BrowseRefParams.DataSet['SHORT_NAME']);
              end;

           BrowseRefParams.DataSet.Next();
        end;
     end
  else
     EXIT;

     if Rw_Str<>'' then
        Rw_Str := '('+Rw_Str+')';

     Update_Local_QueryPlaces();

end;

procedure TfmRwWagonDislocationEx.frPlace_1dgrBrowseMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var src: TMalDBGrid;
var cell: TGridCoord;

procedure ShowTrainStatus(operID: integer);
begin
  sqlGetTrainStatus.ParamByName('P_RW_WAGON_OPER_ID').AsInteger := operID;
  sqlGetTrainStatus.ParamByName('P_TIMEPOINT').AsDateTime := now();
  sqlGetTrainStatus.Execute;

  umessages.Information(
     uStrUtils.ReplaceStr(sqlGetTrainStatus.ParamByName('P_RESULT').AsString, '#', CRLF));
end;

begin
  inherited;
  src := (Sender as TMalDBGrid);
  if not (ssLeft in Shift) then
     placeAbility[src.tag].frPlace.EndDrag(True);

  if ssAlt in Shift then begin
     cell := src.MouseCoord(X, Y);
     if upperCase(src.Columns.Items[cell.X].FieldName) = upperCase('wagonState') then begin
        if cell.Y = 0 then
           ShowLegend(statusSet)
        else begin
           if cell.Y <= src.DataSource.DataSet.RecordCount then
              ShowTrainStatus(src.DataSource.DataSet.FieldByName('RW_WAGON_OPER_ID').AsInteger);
        end;
     end;
  end;

end;

// ================================================================================================
procedure  TfmRwWagonDislocationEx.setPlaceDSL(PlaceNo, PlaceID: integer);
begin
  if (placeAbility[PlaceNo].L_PLACE_STR_ID = PlaceID) and (PlaceID <> 0) then exit;

  if placeAbility[PlaceNo].L_PLACE_STR_ID <> PlaceID then begin
     placeAbility[PlaceNo].lblSelected.Caption := '';
     placeAbility[PlaceNo].frPlace.dgrBrowse.MSelectedRows.Clear;
  end;

  // освободим текущее место
  sqlLockClear.ParamByName('P_PLACE_ID').AsInteger := placeAbility[PlaceNo].L_PLACE_STR_ID;
  sqlLockClear.Execute;

  // просто очистка
  if PlaceID = 0 then begin
     placeAbility[PlaceNo].L_PLACE_STR_ID := 0;
     placeAbility[PlaceNo].lblPlace.Caption := placeAbility[PlaceNo].laPlaceName;
     placeAbility[PlaceNo].lblPlace.Refresh;
     placeAbility[PlaceNo].PlaceIsLocked := false;
     ShowPlaceValues(PlaceNo);
     exit;
  end;

  // займем новое место
  placeAbility[PlaceNo].L_PLACE_STR_ID := PlaceID;
  placeAbility[PlaceNo].PlaceIsLocked := PlaceIsLocked(PlaceNo);

  if not placeAbility[PlaceNo].PlaceIsLocked then begin
     sqlLockSet.ParamByName('P_PLACE_ID').AsInteger := PlaceID;
     sqlLockSet.Execute;
     sqlGetDateTimeChange.ParamByName('P_PLACE_ID').AsInteger := PlaceID;
     sqlGetDateTimeChange.Execute;
     placeAbility[PlaceNo].DateTimeChange := sqlGetDateTimeChange.ParamByName('P_DATE_CHANGE').AsDateTime;
  end;

  ShowPlaceValues(PlaceNo);
  // просто для вывода дополнительного сообщения
  if placeAbility[PlaceNo].PlaceIsLocked then
     placeAbility[PlaceNo].PlaceIsLocked := PlaceIsLocked(PlaceNo, true);
end;

// проверка блокировки сортировки перед выполнением действия
function  TfmRwWagonDislocationEx.PlaceIsLocked(PlaceID: integer; interactive : boolean = false) : boolean;
var lockInfo: string;
begin
   lockInfo := '';

   sqlLockCheck.ParamByName('P_PLACE_ID').AsInteger := placeAbility[PlaceID].L_PLACE_STR_ID;
   sqlLockCheck.Execute;
   lockInfo :=  trim(sqlLockCheck.ParamByName('P_RESULT').AsString);

   result := lockInfo <> '';

   if interactive and (lockInfo <> '') then
      uMessages.Information('Работа с сортировкой ' + CRLF +
      placeAbility[PlaceID].laPlaceName + ' ' + placeAbility[PlaceID].lblPlaceStr.Caption + CRLF +
      'заблокирована пользователем: ' + CRLF +
      lockInfo
      );
end;


procedure TfmRwWagonDislocationEx.frSelectedList_2dgrBrowseMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
     frSelectedList_2.EndDrag(True);
end;

procedure TfmRwWagonDislocationEx.tmrRefreshTimer(Sender: TObject);
begin
  inherited;
    Exit;
    Update_Local_QueryPlaces;
    LockReleasePlace(1);
    LockReleasePlace(2);
    LockReleasePlace(3);
end;

procedure TfmRwWagonDislocationEx.frPlace_1dgrBrowseCanSelectRecord(
  Sender: TObject; var CanSelectRow: Boolean);
  var tag: integer;
begin
  inherited;
  //exit;

    tag := (Sender as TMalDBGrid).tag;
    CanSelectRow := false;

    if placeAbility[tag].PlaceIsLocked then begin
       placeAbility[tag].PlaceIsLocked := PlaceIsLocked(tag, true);
       if placeAbility[tag].PlaceIsLocked then exit;
       placeAbility[tag].lblPlace.Caption := placeAbility[tag].laPlaceName;
    end;

    CanSelectRow := true;
    placeAbility[tag].frPlace.EndDrag(true);
end;

procedure TfmRwWagonDislocationEx.frPlace_1acRefreshExecute(
  Sender: TObject);
var src: TfrSDIBrowse;
begin
  inherited;
  if not((Sender as TComponent).Owner.ClassName = 'TfrSDIBrowse') then exit;
  src := ((Sender as TComponent).Owner as TfrSDIBrowse);

  if src.tag = BUFFER_PLACE then begin
     reOpenQuery(quPlace_4);
  end else begin
     placeAbility[src.tag].freshRepositionListID := '';
     placeAbility[src.tag].foundListID := '';
     UpdateQuery_Place(src.tag);
     LockReleasePlace(src.tag);
  end;
end;

procedure TfmRwWagonDislocationEx.LockReleasePlace(aPlaceNo:Integer);
begin

end;

procedure TfmRwWagonDislocationEx.brReorder_1Click(Sender: TObject);
begin
  inherited;
    btReorderClick(1);
end;

procedure TfmRwWagonDislocationEx.brReorder_2Click(Sender: TObject);
begin
   btReorderClick(2);
end;

procedure TfmRwWagonDislocationEx.brReorder_3Click(Sender: TObject);
begin
  inherited;
     btReorderClick(3);
end;

procedure TfmRwWagonDislocationEx.btReorderClick(aPlaceNo: Integer);
//Var
 // Loc_HEAD_ORDER : Integer;
begin

//    if F_ALLOW_CHANGE_SORT=False then
//       begin
//         umessages.Error('У Вас нет прав на корректировку данных по сортировкам, доступен только просмотр');
//         Exit;
//       end;

    if Loc_ResortModeEnabled = 0 then
       begin
         uMessages.Error('Необходимо включить режим принудительной пересортировки');
         Exit;
       end;

//    Loc_HEAD_ORDER := -1;
//
//    if (aplaceNo=1) and (L_PLACE_STR_1_ID<>0) and (frPlace_1.dsBrowse.DataSet.RecordCount<>0) then
//       begin
//          ReorderWagons(1, 99, Loc_HEAD_ORDER, 0);
//       end;
//
//    if (aplaceNo=2) and (L_PLACE_STR_2_ID<>0) and (frPlace_2.dsBrowse.DataSet.RecordCount<>0) then
//       begin
//         ReorderWagons(2, 99, Loc_HEAD_ORDER, 0);
//       end;
//
//    if (aplaceNo=3) and (L_PLACE_STR_3_ID<>0) and (frPlace_3.dsBrowse.DataSet.RecordCount<>0) then
//       begin
//         ReorderWagons(3, 99, Loc_HEAD_ORDER, 0);
//       end;
end;

procedure TfmRwWagonDislocationEx.cbOnlyArrivedClick(Sender: TObject);
begin
  inherited;
    if not Self.Visible then EXIT;
    if modalResult=mrOk then EXIT;
    If F_UpdateMode = 0 then Exit;

    F_FULL_REOPEN:=1;
    F_LIMIT_UNI_PLACES:=1;
    ReopenMainQuery();
    UpdateAll_QueryPlaces();
    F_FULL_REOPEN:=0;
    F_LIMIT_UNI_PLACES:=0;
end;

procedure TfmRwWagonDislocationEx.quSelectRwWagonList_OLDAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
   (quSelectRwWagonList.FieldByName('Idle_Time') as TNumericField).DisplayFormat := ',0.00;-,0.00;#';
end;

procedure TfmRwWagonDislocationEx.pcMainChange(Sender: TObject);
begin
  inherited;
    if not Self.Visible then Exit;
    if pcMain.ActivePageIndex=1 then
       begin
         Label9.Visible :=False;
         laRecordFound.Visible :=False;
         edSearhWagonNo.Visible :=False;
         btSearhByWagonNo.Visible :=False;
         cbxSearhByWagonNo.Visible :=False;
         rgInsertMode.Visible:=False;
         btRecallData.Enabled := True;
         btRecallData.Visible := True;
         cbShowWaitingForUShpt.Visible := False;
         cbShowWaitingForUShpt.Enabled := False;
         if frShptPlaces.dsBrowse.DataSet.RecordCount<>0 then
            begin
              frShptPlaces.dgrBrowse.SetFocus;
              frShptPlaces.dsBrowse.DataSet.First;
            end;
       end
    else
      begin
         Label9.Visible :=True;
         laRecordFound.Visible :=True;
         edSearhWagonNo.Visible :=True;
         btSearhByWagonNo.Visible  := True;
         cbxSearhByWagonNo.Visible := True;
         rgInsertMode.Visible:=true;
         btRecallData.Enabled := False;
         btRecallData.Visible := False;
         cbShowWaitingForUShpt.Visible := True;
         cbShowWaitingForUShpt.Enabled := True;
         // если нет еще данных по сортировкам - выполнить запрос
         if (quPlace_1.RecordCount=0) and (quPlace_2.RecordCount=0) and (quPlace_3.RecordCount=0) then
            begin
              F_FuLL_REOPEN := 1;
              Update_Local_QueryPlaces();
              F_FuLL_REOPEN := 0;
            end;
      end;
end;

procedure TfmRwWagonDislocationEx.SetCauseNote(aCauseStr: String; aMode: Integer; aFrameID: Integer);
var
  i : Integer;
begin
   sqlSetDislocNote.Session := LSession;

   // фрейм просмотра вагонов в дислокации
   if aFrameID=0 then begin
        with frBrowseRwWagonList do
          if dgrBrowse.MSelectedRows.Count > 0 then
             begin
                sqlDeleteTmpID.Execute;
                for I := 0 to dgrBrowse.MSelectedRows.Count - 1 do
                begin
                  DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));
                  sqlInsertIntoTmpID.ParamByName('P_ID').AsInteger:=VarToInt(dsBrowse.Dataset['RW_WAGON_LIST_ID'],0);
                  sqlInsertIntoTmpID.Execute;
                end;
                sqlInsertIntoTmpID.Session.Commit;

                 // обработать примечание
                sqlSetDislocNote.ParamByName('P_MODE').AsInteger := aMode;
                sqlSetDislocNote.ParamByName('P_ADD_DISLOCATION_NOTE').AsString := aCauseStr;
                sqlSetDislocNote.Execute;
                sqlSetDislocNote.Session.Commit;

                dgrBrowse.MSelectedRows.Clear();
                acRefreshExecute(Self);
             end
          else
             uMessages.Error('Не отмечены вагоны для проведения операции');
         exit;
      end;

        with placeAbility[aFrameID].frPlace do
          if dgrBrowse.MSelectedRows.Count > 0 then
             begin
                sqlDeleteTmpID.Execute;
                for I := 0 to dgrBrowse.MSelectedRows.Count - 1 do
                begin
                  DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));
                  sqlInsertIntoTmpID.ParamByName('P_ID').AsInteger:=VarToInt(dsBrowse.Dataset['RW_WAGON_LIST_ID'],0);
                  sqlInsertIntoTmpID.Execute;
                end;
                sqlInsertIntoTmpID.Session.Commit;

                 // обработать примечание
                sqlSetDislocNote.ParamByName('P_MODE').AsInteger := aMode;
                sqlSetDislocNote.ParamByName('P_ADD_DISLOCATION_NOTE').AsString := aCauseStr;
                sqlSetDislocNote.Execute;
                sqlSetDislocNote.Session.Commit;

                dgrBrowse.MSelectedRows.Clear();
                acRefreshExecute(Self);
             end
          else
             uMessages.Error('Не отмечены вагоны для проведения операции');
end;


procedure TfmRwWagonDislocationEx.SetNoteClick(Sender: TObject);
var Loc_Cause_Str : String;
begin
  inherited;
    Loc_Cause_Str:='';
    Loc_Cause_Str := iunsiRw.SetCauseStr(BrowseRefParams,1);
    if Loc_Cause_Str<>'' then
       SetCauseNote(Loc_Cause_Str,1,0);
end;

procedure TfmRwWagonDislocationEx.ClearNoteClick(Sender: TObject);
begin
  inherited;
     SetCauseNote('',0,0);
end;

procedure TfmRwWagonDislocationEx.SetNote_1Click(Sender: TObject);
var
  Loc_Cause_Str : String;
begin
  inherited;
    Loc_Cause_Str:='';
    Loc_Cause_Str := iunsiRw.SetCauseStr(BrowseRefParams,1);
    if Loc_Cause_Str<>'' then
       SetCauseNote(Loc_Cause_Str,1,(Sender as TComponent).tag);
end;

procedure TfmRwWagonDislocationEx.Clear_Note_1Click(Sender: TObject);
begin
  inherited;
     SetCauseNote('',0,(Sender as TComponent).tag);
end;

procedure TfmRwWagonDislocationEx.ColorGridWagonlistClick(Sender: TObject);
begin
  inherited;
    If ColorGridWagonlist.Selection in [9,10,11,13,14,15] then
       //
    else
      begin
        uMessages.Error('Этот цвет не обрабатывается');
        Exit;
      end;
    SetColorByWagon();
end;

procedure TfmRwWagonDislocationEx.ColorGridPlacesClick(Sender: TObject);
begin
  inherited;
    If ColorGridPlaces.Selection in [9,10,11,13,14,15] then
       //
    else
      begin
        uMessages.Error('Этот цвет не обрабатывается');
        Exit;
      end;
    SetColorByWagon();
end;

procedure TfmRwWagonDislocationEx.SetColorByWagon () ;
var
  L_Color     : String;
  i           : Integer;
  l_SAVE_ID_0 : Integer;
  l_SAVE_ID_1 : Integer;
  l_SAVE_ID_2 : Integer;
  l_SAVE_ID_3 : Integer;

begin
    if (frBrowseRwWagonList.dgrBrowse.MSelectedRows.Count=0)
       and
      (frPlace_1.dgrBrowse.MSelectedRows.Count=0)
       and
      (frPlace_2.dgrBrowse.MSelectedRows.Count=0)
       and
      (frPlace_3.dgrBrowse.MSelectedRows.Count=0)
    then
       begin
         uMessages.Error('Не отмечен ни один вагон');
         Exit;
       end;

        with frBrowseRwWagonList do
          if dgrBrowse.MSelectedRows.Count > 0 then  begin
               l_SAVE_ID_0 := 0;
               if dsBrowse.DataSet.RecordCount<>0 then
                  l_SAVE_ID_0 := VarToInt(dsBrowse.DataSet['Rw_Wagon_List_ID'],0);

               sqlDeleteTmpID.Execute;

               for I := 0 to dgrBrowse.MSelectedRows.Count - 1 do  begin
                  DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));
                  sqlInsertIntoTmpID.ParamByName('P_ID').AsInteger:=VarToInt(dsBrowse.Dataset['RW_WAGON_LIST_ID'],0);
                  sqlInsertIntoTmpID.Execute;
               end;
               sqlInsertIntoTmpID.Session.Commit;
                 // обработать цвет

               // Красный
               If ColorGridWagonlist.Selection=9 then
                   L_Color := 'clRed';
               // Лимон
               If ColorGridWagonlist.Selection=10 then
                   L_Color := 'clLime';
               // Желтый
               If ColorGridWagonlist.Selection=11 then
                   L_Color := 'clYellow';
               // Fuchsia
               If ColorGridWagonlist.Selection=13 then
                  L_Color := 'clFuchsia';
               // Aqua
               If ColorGridWagonlist.Selection=14 then
                  L_Color := 'clAqua';
               // Белый
               If ColorGridWagonlist.Selection=15 then
                  L_Color := '';

               sqlSetColor.ParamByName('P_COLOR').AsString := l_color;
               sqlSetColor.Execute;
               sqlSetColor.Session.Commit;

               dgrBrowse.MSelectedRows.Clear();
               acRefreshExecute(Self);
               if L_SAVE_ID_0<>0 then
                   dsBrowse.DataSet.Locate('RW_WAGON_LIST_ID',L_SAVE_ID_0,[])
          end;


        with frPlace_1 do
          if dgrBrowse.MSelectedRows.Count > 0 then
             begin
               l_SAVE_ID_1 := 0;
               if dsBrowse.DataSet.RecordCount<>0 then
                  l_SAVE_ID_1 := VarToInt(dsBrowse.DataSet['Rw_Wagon_List_ID'],0);
                sqlDeleteTmpID.Execute;
                for I := 0 to dgrBrowse.MSelectedRows.Count - 1 do
                begin
                  DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));
                  sqlInsertIntoTmpID.ParamByName('P_ID').AsInteger:=VarToInt(dsBrowse.Dataset['RW_WAGON_LIST_ID'],0);
                  sqlInsertIntoTmpID.Execute;
                end;
                sqlInsertIntoTmpID.Session.Commit;
                 // обработать цвет

                // Красный
                If ColorGridPlaces.Selection=9 then
                   L_Color := 'clRed';
                // Лимон
                If ColorGridPlaces.Selection=10 then
                   L_Color := 'clLime';
                // Желтый
                If ColorGridPlaces.Selection=11 then
                   L_Color := 'clYellow';
                // Fuchsia
                If ColorGridPlaces.Selection=13 then
                   L_Color := 'clFuchsia';
                // Aqua
                If ColorGridPlaces.Selection=14 then
                   L_Color := 'clAqua';
                // Белый
                If ColorGridPlaces.Selection=15 then
                   L_Color := '';

                sqlSetColor.ParamByName('P_COLOR').AsString := l_color;
                sqlSetColor.Execute;
                sqlSetColor.Session.Commit;

                dgrBrowse.MSelectedRows.Clear();
                acRefreshExecute(Self);
                if L_SAVE_ID_1<>0 then
                   dsBrowse.DataSet.Locate('RW_WAGON_LIST_ID',L_SAVE_ID_1,[])
             end;

        with frPlace_2 do
          if dgrBrowse.MSelectedRows.Count > 0 then
             begin
               l_SAVE_ID_2 := 0;
               if dsBrowse.DataSet.RecordCount<>0 then
                  l_SAVE_ID_2 := VarToInt(dsBrowse.DataSet['Rw_Wagon_List_ID'],0);
                sqlDeleteTmpID.Execute;
                for I := 0 to dgrBrowse.MSelectedRows.Count - 1 do
                begin
                  DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));
                  sqlInsertIntoTmpID.ParamByName('P_ID').AsInteger:=VarToInt(dsBrowse.Dataset['RW_WAGON_LIST_ID'],0);
                  sqlInsertIntoTmpID.Execute;
                end;
                sqlInsertIntoTmpID.Session.Commit;
                 // обработать цвет

                // Красный
                If ColorGridPlaces.Selection=9 then
                   L_Color := 'clRed';
                // Лимон
                If ColorGridPlaces.Selection=10 then
                   L_Color := 'clLime';
                // Желтый
                If ColorGridPlaces.Selection=11 then
                   L_Color := 'clYellow';
                // Fuchsia
                If ColorGridPlaces.Selection=13 then
                   L_Color := 'clFuchsia';
                // Aqua
                If ColorGridPlaces.Selection=14 then
                   L_Color := 'clAqua';
                // Белый
                If ColorGridPlaces.Selection=15 then
                   L_Color := '';

                sqlSetColor.ParamByName('P_COLOR').AsString := l_color;
                sqlSetColor.Execute;
                sqlSetColor.Session.Commit;

                dgrBrowse.MSelectedRows.Clear();
                acRefreshExecute(Self);
                if L_SAVE_ID_2<>0 then
                   dsBrowse.DataSet.Locate('RW_WAGON_LIST_ID',L_SAVE_ID_2,[])
             end;

        with frPlace_3 do
          if dgrBrowse.MSelectedRows.Count > 0 then
             begin
               l_SAVE_ID_3 := 0;
               if dsBrowse.DataSet.RecordCount<>0 then
                  l_SAVE_ID_3 := VarToInt(dsBrowse.DataSet['Rw_Wagon_List_ID'],0);
                sqlDeleteTmpID.Execute;
                for I := 0 to dgrBrowse.MSelectedRows.Count - 1 do
                begin
                  DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));
                  sqlInsertIntoTmpID.ParamByName('P_ID').AsInteger:=VarToInt(dsBrowse.Dataset['RW_WAGON_LIST_ID'],0);
                  sqlInsertIntoTmpID.Execute;
                end;
                sqlInsertIntoTmpID.Session.Commit;
                 // обработать цвет

                // Красный
                If ColorGridPlaces.Selection=9 then
                   L_Color := 'clRed';
                // Лимон
                If ColorGridPlaces.Selection=10 then
                   L_Color := 'clLime';
                // Желтый
                If ColorGridPlaces.Selection=11 then
                   L_Color := 'clYellow';
                // Fuchsia
                If ColorGridPlaces.Selection=13 then
                   L_Color := 'clFuchsia';
                // Aqua
                If ColorGridPlaces.Selection=14 then
                   L_Color := 'clAqua';
                // Белый
                If ColorGridPlaces.Selection=15 then
                   L_Color := '';

                sqlSetColor.ParamByName('P_COLOR').AsString := l_color;
                sqlSetColor.Execute;
                sqlSetColor.Session.Commit;

                dgrBrowse.MSelectedRows.Clear();
                acRefreshExecute(Self);
                if L_SAVE_ID_3<>0 then
                   dsBrowse.DataSet.Locate('RW_WAGON_LIST_ID',L_SAVE_ID_3,[])
             end;

end;

procedure TfmRwWagonDislocationEx.rgType_PlacesClick(Sender: TObject);
begin
  inherited;
   Update_Local_QueryPlaces();
end;

procedure TfmRwWagonDislocationEx.cbxWagonStatusChange(Sender: TObject);
begin
  inherited;
    if not Self.Visible then EXIT;
    if modalResult=mrOk then EXIT;
    If F_UpdateMode = 0 then Exit;

    L_State_ID := cbxWagonStatus.KeyValue;
    F_FULL_REOPEN:=1;
    F_LIMIT_UNI_PLACES:=1;
    ReopenMainQuery();
    UpdateQueryDislocationPlaces();
    F_FULL_REOPEN:=0;
    F_LIMIT_UNI_PLACES:=0;
end;

procedure TfmRwWagonDislocationEx.cbWagonsForExternalPlaceClick(
  Sender: TObject);
begin
  inherited;
    if not Self.Visible then EXIT;
    if modalResult=mrOk then EXIT;

    F_UpdateMode := 0;
    if cbWagonsForExternalPlace.Checked=True then
       begin
         btMoveToExternalPlace.Enabled := True;
         btMoveToExternalPlace.Visible := True;
         cbShowAllWagons.Checked := True;
         rgType_Disloc.ItemIndex := 2;
         cbxWagonStatus.KeyValue := -1;
       end
    else
       begin
         btMoveToExternalPlace.Enabled := False;
         btMoveToExternalPlace.Visible := False;
         cbShowAllWagons.Checked := False;
         rgType_Disloc.ItemIndex := 0;
       end;

    F_UpdateMode := 1;

    F_FULL_REOPEN:=1;
    F_LIMIT_UNI_PLACES:=1;
    ReopenMainQuery();
    UpdateAll_QueryPlaces();
    F_FULL_REOPEN:=0;
    F_LIMIT_UNI_PLACES:=0;

end;

procedure TfmRwWagonDislocationEx.btMoveToExternalPlaceClick(
  Sender: TObject);
var
  Loc_LastDate   : TDateTime;
  I              : Integer;
  Loc_ErrStr     : String;
begin
  inherited;

     If frBrowseRwWagonList.dgrBrowse.MSelectedRows.Count = 0 then
     begin
        umessages.Error('Не отмечены вагоны для постановки под погрузку ' );
        Exit;
     end;

    If SetupDateTime - Int(SetupDateTime) = 0 then
      begin
        umessages.Error('В устанавливаемой дате отсутствует ВРЕМЯ ' );
        Exit;
      end;

     If SetupDateTime > Now()-1/24*2 then
      begin
        umessages.Error('Устанавливаемое дата-время не может быть больше текущего ' );
        Exit;
      end;


   with frBrowseRwWagonList do
   if dgrBrowse.MSelectedRows.Count > 0 then
   begin
      for I := 0 to dgrBrowse.MSelectedRows.Count - 1 do
      begin
        DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));

        pkRailway_System.Params.Clear();
        pkRailWay_System.ExecProc('F_Get_Last_WagonOperation_Date',
        [
         VarToInt(DataSet['RW_WAGON_LIST_ID']),
         1
        ] );

        //Loc_LastDate := pkRailWay_System.Params.ParamByName('RESULT').AsDateTime;

                pkRailway_System.Params.Clear();
        pkRailWay_System.ExecProc('F_Get_Last_WagonOperation_Date',
        [
         VarToInt(DataSet['RW_WAGON_LIST_ID']),
         1
        ] );

        Loc_LastDate := pkRailWay_System.Params.ParamByName('RESULT').AsDateTime;

        SqlInsertWagonOperToExternalPlace.Session := Lsession;
        if SetupDateTime > Loc_LastDate then
           begin
              sqlInsertWagonOperToExternalPlace.ParamByName('P_Wagon_List_ID').AsInteger     := VarToInt(DataSet['Rw_wagon_list_id'],0);
              sqlInsertWagonOperToExternalPlace.ParamByName('P_GDC_ID').AsInteger            := Loc_gdc_Place_ID;
              sqlInsertWagonOperToExternalPlace.ParamByName('P_Shpt_PLACE_ID').AsInteger     := DEF_OTHERS_RAILWAY_PLACE_ID; // код внешних путей хранения
              sqlInsertWagonOperToExternalPlace.ParamByName('P_Shpt_PLACE_STR_ID').AsInteger := DEF_OTHERS_RAILWAY_PLACE_STR_ID;
              sqlInsertWagonOperToExternalPlace.ParamByName('P_Locomotive_SID').AsInteger    := Loc_LOCOMOTIVE_SID;
              sqlInsertWagonOperToExternalPlace.ParamByName('P_Operation_Date').AsDateTime   := SetupDateTime;
              sqlInsertWagonOperToExternalPlace.Execute;
           end
        else
           begin
             Loc_ErrStr := 'Вагон '+ VarToStr(DataSet['WAGON_No']) + ' - Дата последней операции с вагоном ' + DateTimeToStr(Loc_LastDate)  + ' уже больше той что Вы указали ! Операция отменяется';
             umessages.Error(Loc_ErrStr);
           end;
      end;
      dgrBrowse.MSelectedRows.Clear();
      umessages.Information('Операция завершилась');
      acRefreshExecute(Self);
   end;

end;

procedure TfmRwWagonDislocationEx.N8Click(Sender: TObject);
begin
  inherited;
  BrowseRefParams.BrowseOptionSet := [boInsert,boEdit, BOdELETE];
  iunsirw.BrowseShptPlace(BrowseRefParams);
end;

procedure TfmRwWagonDislocationEx.rgWagonOwnerClick(Sender: TObject);
begin
  inherited;
  If F_UpdateMode = 0 then Exit;

    F_FULL_REOPEN:=1;
    F_LIMIT_UNI_PLACES:=1;
    ReopenMainQuery();
    UpdateAll_QueryPlaces();
    F_FULL_REOPEN:=0;
    F_LIMIT_UNI_PLACES:=0;
end;

procedure TfmRwWagonDislocationEx.cbShptWithApprovalDateClick(
  Sender: TObject);
begin
  inherited;
    if not Self.Visible then EXIT;
    if modalResult=mrOk then EXIT;
    If F_UpdateMode = 0 then Exit;

    F_UpdateMode := 1;

    F_FULL_REOPEN:=1;
    F_LIMIT_UNI_PLACES:=1;
    ReopenMainQuery();
    UpdateAll_QueryPlaces();
    F_FULL_REOPEN:=0;
    F_LIMIT_UNI_PLACES:=0;

end;

procedure TfmRwWagonDislocationEx.rgCargoOperClick(Sender: TObject);
begin
  inherited;
    if not Self.Visible then EXIT;
    if modalResult=mrOk then EXIT;
    If F_UpdateMode = 0 then Exit;

    Update_Local_QueryPlaces();
end;

procedure TfmRwWagonDislocationEx.cbCommerceErrorClick(Sender: TObject);
begin
  inherited;
    if not Self.Visible then EXIT;
    if modalResult=mrOk then EXIT;
    If F_UpdateMode = 0 then Exit;

    F_UpdateMode := 1;

    F_FULL_REOPEN:=1;
    F_LIMIT_UNI_PLACES:=1;
    ReopenMainQuery();
    UpdateAll_QueryPlaces();
    F_FULL_REOPEN:=0;
    F_LIMIT_UNI_PLACES:=0;

end;

procedure TfmRwWagonDislocationEx.rbSelectPlace_1ShowRecordButtonClick(
  Sender: TObject);
Var
  SaveID     : Integer;
  Loc_Idle_Begin_Date  : TdateTime;
  Loc_Arrival_Date     : TdateTime;
  Loc_Depart_Date      : TdateTime;
begin
  inherited;

    SaveID := VarToInt(quPlace_1['Rw_Wagon_List_ID'],0);

    if SaveID=0 then EXIT;

    If VarToDate(quPlace_1['Idle_begin_Date']) <> 0 then
       Loc_Idle_Begin_Date := VarToDateTime(quPlace_1['Idle_begin_Date'])
    else
      Loc_Idle_Begin_Date := 0;

    if VarToDate(quPlace_1['Arrival_Date']) <> 0 then
       Loc_Arrival_Date  := VarToDateTime(quPlace_1['Arrival_Date'])
    else
       Loc_Arrival_Date  := 0;

    If VarToDate(quPlace_1['Depart_Date']) <> 0 then
       Loc_Depart_Date := VarToDateTime(quPlace_1['Depart_Date'])
    else
       Loc_Depart_Date := 0;

   RwWagonListCard(Lsession,quPlace_1['Rw_Wagon_List_ID'],cmEdit,0,Loc_Idle_Begin_Date,Loc_Depart_Date ,Loc_Arrival_Date,0);

   frPlace_1.acRefreshExecute(Sender);
   frPlace_1.DataSet.Locate('Rw_Wagon_List_ID', SaveID, []);
   If Self.Visible then
      frPlace_1.dgrBrowse.SetFocus;

end;

procedure TfmRwWagonDislocationEx.rbSelectPlace_2ShowRecordButtonClick(
  Sender: TObject);
Var
  SaveID     : Integer;
  Loc_Idle_Begin_Date  : TdateTime;
  Loc_Arrival_Date     : TdateTime;
  Loc_Depart_Date      : TdateTime;
begin
  inherited;

    SaveID := VarToInt(quPlace_2['Rw_Wagon_List_ID'],0);

    if SaveID=0 then EXIT;

    If VarToDate(quPlace_2['Idle_begin_Date']) <> 0 then
       Loc_Idle_Begin_Date := VarToDateTime(quPlace_2['Idle_begin_Date'])
    else
      Loc_Idle_Begin_Date := 0;

    if VarToDate(quPlace_2['Arrival_Date']) <> 0 then
       Loc_Arrival_Date  := VarToDateTime(quPlace_2['Arrival_Date'])
    else
       Loc_Arrival_Date  := 0;

    If VarToDate(quPlace_2['Depart_Date']) <> 0 then
       Loc_Depart_Date := VarToDateTime(quPlace_2['Depart_Date'])
    else
       Loc_Depart_Date := 0;

   RwWagonListCard(Lsession,quPlace_2['Rw_Wagon_List_ID'],cmEdit,0,Loc_Idle_Begin_Date,Loc_Depart_Date ,Loc_Arrival_Date,0);

   UpdateQuery_Place(2);

   frPlace_2.acRefreshExecute(Sender);
   frPlace_2.DataSet.Locate('Rw_Wagon_List_ID', SaveID, []);
   If Self.Visible then
      frPlace_2.dgrBrowse.SetFocus;

end;

procedure TfmRwWagonDislocationEx.rbSelectPlace_3ShowRecordButtonClick(
  Sender: TObject);
Var
  SaveID     : Integer;
  Loc_Idle_Begin_Date  : TdateTime;
  Loc_Arrival_Date     : TdateTime;
  Loc_Depart_Date      : TdateTime;
begin
  inherited;
    SaveID := VarToInt(quPlace_3['Rw_Wagon_List_ID'],0);

    if SaveID=0 then EXIT;

    If VarToDate(quPlace_3['Idle_begin_Date']) <> 0 then
       Loc_Idle_Begin_Date := VarToDateTime(quPlace_3['Idle_begin_Date'])
    else
      Loc_Idle_Begin_Date := 0;

    if VarToDate(quPlace_3['Arrival_Date']) <> 0 then
       Loc_Arrival_Date  := VarToDateTime(quPlace_3['Arrival_Date'])
    else
       Loc_Arrival_Date  := 0;

    If VarToDate(quPlace_3['Depart_Date']) <> 0 then
       Loc_Depart_Date := VarToDateTime(quPlace_3['Depart_Date'])
    else
       Loc_Depart_Date := 0;

   RwWagonListCard(Lsession,quPlace_3['Rw_Wagon_List_ID'],cmEdit,0,Loc_Idle_Begin_Date,Loc_Depart_Date ,Loc_Arrival_Date,0);

   frPlace_3.acRefreshExecute(Sender);
   frPlace_3.DataSet.Locate('Rw_Wagon_List_ID', SaveID, []);
   If Self.Visible then
      frPlace_3.dgrBrowse.SetFocus;

end;

procedure TfmRwWagonDislocationEx.N9Click(Sender: TObject);
//var l_Id : Integer;
begin
  inherited;
//    l_ID := 0;
    iurwinnerClime.RwInnerClimeBrw(Lsession as TMalOraSession);
end;

procedure TfmRwWagonDislocationEx.Button1Click(Sender: TObject);
begin
  inherited;
     BrowseRefParams.DatePeriod.BeginDate := Date() - 90;
     BrowseRefParams.DatePeriod.EndDate := Date();
     BrowseRefParams.BrowseOptionSet := [];
     iurwinnerClime.RwInnerClimeSelect(BrowseRefParams,VarToInt(frBrowseRwWagonList.dsBrowse.DataSet['Rw_wagon_list_ID']));
end;

procedure TfmRwWagonDislocationEx.frPlace_1acPrintExecute(Sender: TObject);
begin
  inherited;
    if frPlace_1.dsBrowse.DataSet.RecordCount<>0 then
       Print_Report_Disclocation_Place(1);
end;

procedure TfmRwWagonDislocationEx.Print_Report_Disclocation_Place(aPlaceNo: Integer);
begin

   if cbLightShow.Checked=True then
      begin
        Print_Report_Disclocation_Place_Excel(aPlaceNo);
        Exit;
      end;

    with rpWagonList do begin
      try
        rpWagonList.ReportName := 'L:\MALAHIT\REPORTS\GDC\DislocPlaceWagonList.rpt';
        cdsWagonList.DataSet := placeAbility[aPlaceNo].quPlace;

        rpWagonList.ParamByName('PLACE_FULL_NAME', '').CurrentValue :=
        placeAbility[aPlaceNo].laPlaceName  + ' ' + placeAbility[aPlaceNo].lblPlaceStr.Caption;
        rpWagonList.ParamByName('PLACE_QNTY', '').CurrentValue := '';

        if placeAbility[aPlaceNo].L_PLACE_WAGON_QNTY <> 0 then
           rpWagonList.ParamByName('PLACE_QNTY', '').CurrentValue := VarToStr(placeAbility[aPlaceNo].L_PLACE_WAGON_QNTY);

      Tables[0].DataPointer := cdsWagonList.DataPointer;

      ParamFields.AllowDialog := false;
      Execute();

        while not PrintEnded do Application.ProcessMessages();
      finally
        CloseJob();
      end;
    end;

end;



procedure TfmRwWagonDislocationEx.frPlace_2acPrintExecute(Sender: TObject);
begin
  inherited;
    if frPlace_2.dsBrowse.DataSet.RecordCount<>0 then
       Print_Report_Disclocation_Place(2);
end;

procedure TfmRwWagonDislocationEx.frPlace_3acPrintExecute(Sender: TObject);
begin
  inherited;
    if frPlace_3.dsBrowse.DataSet.RecordCount<>0 then
       Print_Report_Disclocation_Place(3);
end;

procedure TfmRwWagonDislocationEx.btSetWagonNoOrderClick(Sender: TObject);
var
   Loc_IsWagonListValid : Boolean;
//   Loc_Exclude_Str      : String;
   L_PLACE_STR_ID       : Integer;
begin
  inherited;

    loc_WagonListStr  := Trim(edWagonNO.Text);
    loc_CommaCountStr := '';
    Loc_IsWagonListValid := IsWagonListValid(loc_WagonListStr,Loc_CommaCountStr);

    if Loc_IsWagonListValid=False  then
       begin
         umessages.Error('Некорректно задана строка с номерами вагонов для выполнения операции');
         Exit;
       end;

    If rgPlaceNo.ItemIndex=0 then
       begin
         umessages.Error('Выберите номер рабочего места для выполнения операции');
         Exit;
       end;

    L_PLACE_STR_ID := placeAbility[rgPlaceNo.ItemIndex].L_PLACE_STR_ID;

    if Loc_IsWagonListValid = False then
       begin
        edWagonNO.SetFocus;
        Exit;
       end
    else
       begin
         edWagonNO.Text   := loc_WagonListStr;
         loc_WagonListStr := '(' + loc_WagonListStr + ')';

         pkRailway_System.Params.Clear();
         pkRailWay_System.ExecProc('P_Set_LocalOrderInTrainByWLIST', [ VarToFloat(L_PLACE_STR_ID) , loc_WagonListStr ] );

       end;

    case rgPlaceNo.ItemIndex of
      1: frplace_1.acRefreshExecute(Sender);
      2: frplace_2.acRefreshExecute(Sender);
      3: frplace_3.acRefreshExecute(Sender);
    end;

end;


procedure TfmRwWagonDislocationEx.ResortModeClick(Sender: TObject);
begin
  inherited;
    if Loc_ResortModeEnabled=1 then
       begin
         Loc_ResortModeEnabled:=0;
         ResortMode.Caption := 'Режим автоматической пересортировки ВЫКЛ';
       end
    else
       begin
         Loc_ResortModeEnabled:=1;
         ResortMode.Caption := 'Режим автоматической пересортировки ВКЛ';
       end;
end;

procedure TfmRwWagonDislocationEx.rgInsertModeClick(Sender: TObject);
begin
  inherited;

  //   Update_Local_QueryPlaces();
end;

procedure TfmRwWagonDislocationEx.btSearhByWagonNoBrowseButtonClick(
  Sender: TObject);
var i, n: integer;
var str: string;
begin
  inherited;

  // проверка строки поиска

  str := uStrUtils.ReplaceStr(edSearhWagonNo.Text, #13#10, ' ');
  str := uStrUtils.ReplaceStr(str, #10#13, ' ');
  str := uStrUtils.ReplaceStr(str, ',', ' ');
  str := trim(str);

  n := -1;
  while (n <> length(str)) do begin
    n := length(str);
    str := uStrUtils.ReplaceStr(str, '  ', ' ');
  end;

  str := uStrUtils.ReplaceStr(str, ' ', ',');
  edSearhWagonNo.Text := str;
  edSearhWagonNo.Repaint;

  n := uStrUtils.WordCount(str, [',']);
  for i := 1 to n do begin
     if not uStrUtils.StringIsNumber(uStrUtils.ExtractWord(i, str, [','])) then begin
        uMessages.Error('Строка поиска может содержать только цифры, разделенные запятыми');
        exit;
     end;
  end;

  laRecordFound.Caption := '';
  sqlSearhByWagonNo.Close;

  if n > 1 then str := ',' + str + ',';
  
  sqlSearhByWagonNoDSL.ParamByName('P_NAME_CACHE').AsString := 'DSL01';
  sqlSearhByWagonNoDSL.ParamByName('P_WAGON_NO').AsString := str;
  sqlSearhByWagonNoDSL.Execute;

  sqlSearhByWagonNo.ParamByName('P_NAME_CACHE').AsString := 'DSL01';
  sqlSearhByWagonNo.Open;

  laRecordFound.Caption := IntToStr(sqlSearhByWagonNo.RecordCount);

  if sqlSearhByWagonNo.RecordCount=0 then  begin
     uMessages.Error('Не найдено вагонов с заданными условиям поиска по номеру на территории предприятия');
     Exit;
  end;

  dsSearhByWagonNo.DataSet.First;
  cbxSearhByWagonNo.KeyValue := dsSearhByWagonNo.DataSet['rw_wagon_list_id'];
end;

procedure TfmRwWagonDislocationEx.edSearhWagonNo1Exit(Sender: TObject);
begin
  inherited;
    btSearhByWagonNoBrowseButtonClick(Sender);
end;

procedure TfmRwWagonDislocationEx.edSearhWagonNo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
    if VarToStr(Key) = '13' then
       btSearhByWagonNoBrowseButtonClick(Sender);
end;

procedure TfmRwWagonDislocationEx.btSearhByWagonNoCleanButtonClick(
  Sender: TObject);
begin
  inherited;
    edSearhWagonNo.Text := '';
end;

procedure TfmRwWagonDislocationEx.cbLightShowClick(Sender: TObject);
begin
  inherited;
    if not Self.Visible then EXIT;
    if modalResult=mrOk then EXIT;
    //If F_UpdateMode = 0 then Exit;

    if cbLightShow.Checked=True then
       Panel13.Visible := False
    else
       begin
         Panel13.Visible := True;
         if pcMain.ActivePageIndex=1 then
            Umessages.Information('Необходимо выполнить перезапрос данных дислокации');
       end;

    if pcMain.ActivePageIndex=0 then
       Update_Local_QueryPlaces();

end;

procedure TfmRwWagonDislocationEx.frShptPlacesacRefreshExecute(
  Sender: TObject);
begin
   F_FULL_REOPEN := 1;
   UpdateQueryDislocationPlaces();
   F_FULL_REOPEN := 0;
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.btRecallDataClick(Sender: TObject);
begin
  inherited;
    if cbLightShow.Checked=True then
       begin
         uMessages.Error('Сначала отключите просмотр в упрощенном режиме');
         Exit;
       end;

     sqlLoadToTmpTable.Session := BrowseRefParams.Session;
     sqlLoadToTmpTable.ParamByName('P_Request_Date').asDateTime := Now();
     sqlLoadToTmpTable.Execute;

     UpdateDataWagonOwner;
     UpdateDataSubClient;

     // вычислить уникальные места
     sqlUniquePlaces.Execute;

     frShptPlacesacRefreshExecute(Sender);
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.Print_Report_Disclocation_Place_Excel(aPlaceNo:Integer);
var
_TRUE  : OleVariant;
_FALSE : OleVariant;

listSelectedID, ReportFileName : string;
ExcelApp       : OleVariant;
Workbook       : Variant;
WorkSheet      : Variant;
Range          : Variant;
i,j                  : Integer;

var frPlace: TfrSDIBrowse;
    flowRow: TBookmark;
begin

    _TRUE:=OleVariant(true);
    _FALSE:=OleVariant(false);

    ReportFileName :='L:\Malahit\Reports\GDC\Template\RwWagonListDislocation.xlt';

    try
      ExcelApp := GetActiveOleObject('Excel.Application');
    except
      ExcelApp := CreateOleObject('Excel.Application');
    end;

   ExcelApp.Visible := False;

   ExcelApp.Application.EnableEvents := False;
   ExcelApp.Workbooks.Open(ReportFileName);

   Workbook  := ExcelApp.ActiveWorkbook;
   WorkSheet := Workbook.ActiveSheet;

   // Наполнение вагонами

  frPlace := placeAbility[aPlaceNo].frPlace; //get_frPlace(aPlaceNo);
  flowRow := frPlace.dsBrowse.DataSet.GetBookmark;
  LockWindowUpdate(frPlace.Handle);

  listSelectedID := '';
  for i := 0 to frPlace.dgrBrowse.MSelectedRows.Count-1 do begin
      frPlace.dsBrowse.DataSet.GotoBookmark(pointer(frPlace.dgrBrowse.MSelectedRows.Items[i]));
      addToString(listSelectedID, VarToStr(frPlace.dsBrowse.Dataset['RW_WAGON_OPER_ID']), ',');
  end;
  if listSelectedID <> '' then listSelectedID := ',' + listSelectedID  + ',';


      WorkSheet.Range['DISLOCK_PLACE_1']:= placeAbility[aPlaceNo].laPlaceName + ' ' + placeAbility[aPlaceNo].lblPlaceStr.Caption;
      AutoRangeMergedHeight(ExcelApp,WorkSheet.Range['DISLOCK_PLACE_1']);

      i:=2;
      j:=1;

      frPlace.dsBrowse.DataSet.First;
      with frPlace.dsBrowse do
        while not DataSet.Eof do  begin

            if listSelectedID <> '' then begin
               if pos(',' + VarToStr(Dataset['RW_WAGON_OPER_ID']) + ',', listSelectedID) <= 0 then begin
                  DataSet.Next;
                  continue;
               end;
            end;
            i := i + 1;

            WorkSheet.Cells[i, 1+j]  := DataSet['COMMON_TECH_COND_SNG'];

            WorkSheet.Cells[i, 2+j]  := DataSet['WAGON_NO'];
            WorkSheet.Cells[i, 3+j]  := DataSet['Wagon_type_NAME'];
            WorkSheet.Cells[i, 4+j]  := DataSet['ADD_DISLOCATION_NOTE'];

            WorkSheet.Cells[i, 6+j]  := DataSet['Wagon_owner_Name'];
            Range     := WorkSheet.Range[WorkSheet.Cells[i, 5+j], WorkSheet.Cells[i, 5+j]];
            Range.Select;
            ExcelApp.Selection.WrapText := True;
            ExcelApp.Selection.Rows.AutoFit;

            WorkSheet.Cells[i, 7+j]  := DataSet['FULL_SHPT_PLACES_NAME'];
            Range     := WorkSheet.Range[WorkSheet.Cells[i, 6+j], WorkSheet.Cells[i, 6+j]];
            Range.Select;
            ExcelApp.Selection.WrapText := True;
            ExcelApp.Selection.Rows.AutoFit;

            WorkSheet.Cells[i, 8+j]  := DataSet['SHPT_STATUS_STR'];
            Range     := WorkSheet.Range[WorkSheet.Cells[i, 7+j], WorkSheet.Cells[i, 7+j]];
            Range.Select;
            if DataSet['SHPT_STATUS_STR']='ГРУ' then begin
               Range.Font.bold  := True;
               Range.Font.Color := ClRed;
            end else begin
               Range.Font.bold  := False;
               Range.Font.Color := clBlack;
            end;

            WorkSheet.Cells[i, 9+j]  := DataSet['COMMERCE_ERR_CURR_EXISTS_STR'];

//            WorkSheet.Cells[i, 9+j]  := 'qwe'; //DataSet['ADD_SHPT_MOVING_STATUS'];
//            Range     := WorkSheet.Range[WorkSheet.Cells[i, 9+j], WorkSheet.Cells[i, 9+j]];
//            Range.Select;
//            ExcelApp.Selection.WrapText := True;
//            ExcelApp.Selection.Rows.AutoFit;

            WorkSheet.Cells[i, 11+j]  := DataSet['Wagons_Teory'];

            sqlGetStationName.ParamByName('P_RW_WAGON_OPER_ID').AsInteger := varToInt(DataSet['RW_WAGON_OPER_ID'],0);
            sqlGetStationName.Execute;
            WorkSheet.Cells[i, 5+j]  := sqlGetStationName.ParamByName('P_RESULT').AsString;

            DataSet.Next;
        end;
    frPlace.dsBrowse.DataSet.GotoBookmark(flowRow);
    LockWindowUpdate(0);

    ExcelApp.Visible := True;
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.AutoRangeMergedHeight(Excel, Range: Variant);
begin
  Range.Select;
  Excel.Selection.MergeCells := False;
  Excel.Selection.HorizontalAlignment:=7;
  Excel.Selection.WrapText := True;
  Excel.Selection.Rows.AutoFit;
  Excel.Selection.Merge;
  Excel.Selection.HorizontalAlignment:=2;
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.N12Click(Sender: TObject);
begin
  inherited;

    if Loc_ResortModeEnabled = 0 then
       begin
         uMessages.Error('Необходимо включить режим принудительной пересортировки');
         Exit;
       end;

     if uMessages.QuestionNo('Будет ПРИНУДИТЕЛЬНО ПЕРЕСОРТИРОВАН порядок вагонов на ВСЕХ местах дислокации по дате начала операции') then
        begin
          sqlReorderWagonsAll.Session := Lsession;
          sqlReorderWagonsAll.Execute;
          Umessages.Information('Процесс закончен');
          if pcMain.ActivePageIndex=0 then
             Update_Local_QueryPlaces;
        end;

end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.cbShowWaitingForUShptClick(
  Sender: TObject);
begin
  inherited;
    if not Self.Visible then EXIT;
    if modalResult=mrOk then EXIT;

    if pcMain.ActivePageIndex=0 then
       Update_Local_QueryPlaces();
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.frPlace_2dgrBrowseTitleBtnClick(
  Sender: TObject; ACol: Integer; Column: TColumnEh);
begin
  inherited;
  frPlace_2.dgrBrowseTitleBtnClick(Sender, ACol, Column);
end;

//=================================================================================================
procedure CheckOrder(qry: TMalOraQuery);
begin
  if Pos('order by', qry.SQL.Text) = 0 then
     qry.SQL.Text := qry.SQL.Text + ' order by baseChainOrder';
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.quPlace_1BeforeOpen(DataSet: TDataSet);
begin
  inherited;
  CheckOrder(quPlace_1);
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.quPlace_2BeforeOpen(DataSet: TDataSet);
begin
  inherited;
  CheckOrder(quPlace_2);
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.quPlace_3BeforeOpen(DataSet: TDataSet);
begin
  inherited;
  CheckOrder(quPlace_3);
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.btRollbackClick(Sender: TObject);
begin
  inherited;
  rollbackProcess(backStep);
end;

//=================================================================================================
procedure showStatus(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState; src: TfrSDIBrowse; arr: array of integer);
var xx, yy, i, cnt: integer;
var statCell: TBitMap;
begin

  cnt := 0;
  while arr[cnt] <> -1 do cnt := cnt + 1;

  statCell := TBitMap.Create;
  statCell.Height := 14;
  statCell.Width  := Column.Width;  //12*i+3;

  xx := 2; yy := 2;
  for i := 0 to cnt-1 do begin
    drawStatus(statCell, statusSet[arr[i]], xx, yy);
    xx := xx + 12;
  end;


  statCell.Canvas.Brush.Color := src.dgrBrowse.Canvas.Brush.Color;
  statCell.Canvas.FloodFill(1,1,clWhite,fsSurface);

  statCell.Canvas.FloodFill(1,1,statCell.Canvas.Pixels[2,2],fsSurface);

  src.dgrBrowse.Canvas.Brush.Color := clWhite;
  src.dgrBrowse.Canvas.FloodFill(1,1,clWhite,fsSurface);
  src.dgrBrowse.Canvas.Draw(Rect.Left, Rect.Top, statCell);
  statCell.Free();
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.getStatusArr(var arr: array of integer; fr: TfrSDIBrowse);
var idx, flowTypeOp: integer;
begin
  if fr.dgrBrowse.DataSource.DataSet.IsEmpty then exit;
  if not Assigned(fr.dgrBrowse.DataSource.DataSet) then  exit;

  with fr.dgrBrowse.DataSource do begin

    flowTypeOp := VarToInt(Dataset['Operation_Type_SID'],0);

    idx := 0;
    arr[idx] := -1;

    // доступность
    case VarToInt(DataSet['wagonState'],0) of
       0: arr[idx] := 0;
       1: arr[idx] := 1;
       2: arr[idx] := 2;
       3: arr[idx] := 3;
    end;
    if arr[idx] <> -1 then inc(idx);
    arr[idx] := -1;

    if DataSet['FUTURE_OPER_EXISTS'] = 1   then    arr[idx] := 12;   // недоступен (есть операции в будущем)
    if arr[idx] <> -1 then inc(idx);
    arr[idx] := -1;


    // неподтвержденные
    //  OP_MOVEMENT   = 2900001;
    //  OP_UNSHIPMENT = 2900002;
    //    OP_SHIPMENT = 2900003;

    if (flowTypeOp = OP_SHIPMENT) and ((VarToInt(Dataset['F_CONFIRMED_OPER'],0) = 0) or (VarToInt(Dataset['F_AUTO'],0) = -3)) then
       arr[idx] := 4;
    if arr[idx] <> -1 then inc(idx);
    arr[idx] := -1;

    if VarToDate(Dataset['F_OUT_CLAIM_DATE']) <> 0 then begin // заявка на вывод
       if (flowTypeOp = OP_SHIPMENT) or (flowTypeOp = OP_UNSHIPMENT) then
          arr[idx] := 11;
    end;

    if arr[idx] <> -1 then inc(idx);
    arr[idx] := -1;

    // собственность
    if Dataset['F_SELF'] = 1                 then arr[idx] := 5;   // собственные вагоны
    if DataSet['WAGON_OWNER_FIRM_ID'] <> 0   then arr[idx] := 6;   // арендованные
    if DataSet['IN_RW_SUBCLIENT_ID'] <> null then arr[idx] := 7;   // вагоны субклиентов
    if DataSet['F_NEW_RECORD'] = 1           then arr[idx] := 8;   // вагоны только что добавленные
    if arr[idx] <> -1 then inc(idx);
    arr[idx] := -1;

    if DataSet['RW_REG_NO'] <> 20            then arr[idx] := 9;   // Разметка не Россия
    if arr[idx] <> -1 then inc(idx);
    arr[idx] := -1;

    if tempOutput(DataSet) then arr[idx] := 10; // временно выведен
    if arr[idx] <> -1 then inc(idx);
    arr[idx] := -1;

    if DataSet['UNFINISHED_CLAIM'] = 1            then arr[idx] := 13;   // незакрытая заявка
    if arr[idx] <> -1 then inc(idx);
    arr[idx] := -1;

  end;
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.frPlace_2dgrBrowseDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var arr: array[0..9] of integer;
begin

  inherited;

  if not Assigned(Column) then   exit;
  if not Assigned(Column.Field) then exit;

  if UpperCase(Column.FieldName) <> UpperCase('wagonState') then exit;

  arr[0] := -1;
  getStatusArr(arr, frPlace_2);
  showStatus(Sender,Rect,DataCol,Column,State,frPlace_2, arr);
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.showAllPoints;
begin
        pLeft.Visible := true;
        pMiddle.Visible := true;
        pRight.Visible := true;

        pLeft.Width := MalPanel5.Width div 3;
        pMiddle.Width := MalPanel5.Width div 3;
        pRight.Width := MalPanel5.Width div 3;

        pLeft.Left := 0;
        pMiddle.Left := pLeft.Width;
        pRight.Left := 2 * pLeft.Width;

        pLeft.Height := MalPanel5.Height;
        pMiddle.Height := MalPanel5.Height;
        pRight.Height := MalPanel5.Height;

        spExpand_1.Left := pLeft.Width - 25;
        spExpand_2.Left := pMiddle.Width - 25;
        spExpand_3.Left := pRight.Width - 25;

        spFindWagon_1.Left := spExpand_1.Left - 25;
        spFindWagon_2.Left := spExpand_2.Left - 25;
        spFindWagon_3.Left := spExpand_3.Left - 25;

        cbTempOutput_1.Left := spFindWagon_1.Left - 130;
        cbTempOutput_2.Left := spFindWagon_2.Left - 130;
        cbTempOutput_3.Left := spFindWagon_3.Left - 130;

        bbClearBuffer.Left := pMiddle.Width - 45;
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.frPlace_3dgrBrowseDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var arr: array[0..9] of integer;
begin

  inherited;

  if not Assigned(Column) then   exit;
  if not Assigned(Column.Field) then exit;

  if UpperCase(Column.FieldName) <> UpperCase('wagonState') then exit;

  arr[0] := -1;
  getStatusArr(arr, frPlace_3);
  showStatus(Sender,Rect,DataCol,Column,State,frPlace_3, arr);
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.frPlace_1dgrBrowseDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var arr: array[0..9] of integer;
begin

  inherited;

  if not Assigned(Column) then   exit;
  if not Assigned(Column.Field) then exit;

  if UpperCase(Column.FieldName) <> UpperCase('wagonState') then exit;

  arr[0] := -1;
  getStatusArr(arr, frPlace_1);
  showStatus(Sender,Rect,DataCol,Column,State,frPlace_1, arr);
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.FormClose(Sender: TObject;
  var Action: TCloseAction);

var i: integer;
begin
  inherited;
//  BrowseRefParams.Session.ExecSQL('begin RAILWAY_LOCATION_PKG.setOperationMode(1); end;',[]);  // !!!!!!!!!!!!

  BrowseRefParams.Session.ExecSQL('delete from tmp_cache_table where taskID = cache.getTaskID(''DSL'')',[]);
  BrowseRefParams.Session.Commit;

  for i := 1 to 3 do begin
     if not PlaceIsLocked(i) then continue;
     sqlLockClear.ParamByName('P_PLACE_ID').AsInteger := placeAbility[i].L_PLACE_STR_ID;
     sqlLockClear.Execute;
  end;

end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.spExpand_1Click(Sender: TObject);
var src: TMalSpeedButton;
begin
  inherited;

  src := (Sender as TMalSpeedButton);

  if src.tag = 1 then begin
     if pLeft.Align = alNone then begin
        pLeft.Align := alClient;
        pMiddle.Visible := false;
        pRight.Visible := false;
     end else begin
        pLeft.Align := alNone;
        showAllPoints;
     end;
     src.Left := pLeft.Width - 25;
     spFindWagon_1.Left := src.Left - 25;
     cbTempOutput_1.Left := spFindWagon_1.Left - 130;
  end;

  if src.tag = 2 then begin
     if pMiddle.Align = alNone then begin
        pMiddle.Align := alClient;
        pLeft.Visible := false;
        pRight.Visible := false;
     end else begin
        pMiddle.Align := alNone;
        showAllPoints;
     end;
     src.Left := pMiddle.Width - 25;
     spFindWagon_2.Left := src.Left - 25;
     cbTempOutput_2.Left := spFindWagon_2.Left - 130;
     bbClearBuffer.Left := pMiddle.Width - 45;
  end;

  if src.tag = 3 then begin
     if pRight.Align = alNone then begin
        pRight.Align := alClient;
        pLeft.Visible := false;
        pMiddle.Visible := false;
     end else begin
        pRight.Align := alNone;
        showAllPoints;
     end;
     src.Left := pRight.Width - 25;
     spFindWagon_3.Left := src.Left - 25;
     cbTempOutput_3.Left := spFindWagon_3.Left - 130;
  end;

end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.spFindWagon_1Click(Sender: TObject);
var src: TMalSpeedButton;
var i, placeID: integer;
begin
  inherited;

  if dsSearhByWagonNo.DataSet.RecordCount = 0 then exit;

  src := (Sender as TMalSpeedButton);

  placeID := VarToInt(dsSearhByWagonNo.DataSet['last_Place_ID'],0);

  for i := 1 to 3 do begin
     if (placeAbility[i].L_PLACE_STR_ID = placeID) and (i <> src.tag) then begin
         umessages.Error('Этот участок уже был выбран ранее');
         Exit;
     end;
  end;

  placeAbility[src.tag].quPlace.Close;

  SetPlaceDSL(src.tag, placeID);
  placeAbility[src.tag].foundListID := '';

  UpdateQuery_Place(src.tag);
  placeAbility[src.tag].frPlace.dgrBrowse.SetFocus;
  placeAbility[src.tag].frPlace.dsBrowse.DataSet.Locate('RW_WAGON_LIST_ID',VartoInt(dsSearhByWagonNo.DataSet['Rw_wagon_list_id'],0),[]);

  if dsSearhByWagonNo.DataSet.RecordCount > 0 then begin
     dsSearhByWagonNo.DataSet.First;
     for i := 0 to dsSearhByWagonNo.DataSet.RecordCount do begin
       addToString(placeAbility[src.tag].foundListID, VarToStr(dsSearhByWagonNo.DataSet['Rw_wagon_list_id']), ',');
       dsSearhByWagonNo.DataSet.Next;
     end;
   end;
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.frSelectedList_2dgrBrowseDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var arr: array[0..9] of integer;
begin
  inherited;

  if not Assigned(Column) then   exit;
  if not Assigned(Column.Field) then exit;

  if UpperCase(Column.FieldName) <> UpperCase('wagonState') then exit;

  arr[0] := -1;
  getStatusArr(arr, frSelectedList_2);
  showStatus(Sender,Rect,DataCol,Column,State,frSelectedList_2, arr);
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.frSelectedList_2N2Click(Sender: TObject);
begin
  inherited;
  showOperation(BrowseRefParams, ((Sender as TComponent).Owner as TfrSDIBrowse));
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.ClaimOutput01Click(Sender: TObject);
var i, aPlaceNo, flowTypeOp: integer;
var err, listClaimed: string;
begin
  inherited;
  aPlaceNo := (Sender as TComponent).tag;

  if (pos('ВГР', placeAbility[aPlaceNo].lblOperation_MODE.Caption) <= 0)
     and
     (pos('ПГР', placeAbility[aPlaceNo].lblOperation_MODE.Caption) <= 0)
     and
     (pos('СДВ', placeAbility[aPlaceNo].lblOperation_MODE.Caption) <= 0) then begin
         umessages.Error('Заявка на вывод формируется в цехах погрузки и/или выгрузки');
         exit;
  end;

  listClaimed := '';
  with placeAbility[aPlaceNo].frPlace do begin
        if dgrBrowse.MSelectedRows.Count <= 0 then begin
           umessages.Error('Нет отмеченных записей'); exit;
        end;

        if not checkTime then exit;

        if not umessages.QuestionNo('Будет установлена дата заявки: ' + DateToStr(SetupDateTime) + ' ' + TimeToStr(SetupDateTime)
                         + #13#10'Продолжить'
            ) then
           exit;

        for i := 0 to dgrBrowse.MSelectedRows.Count-1 do begin
           dsBrowse.DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));
           // на всякий случай...
           flowTypeOp := VarToInt(dsBrowse.Dataset['OPERATION_TYPE_SID'],0);
           if (flowTypeOp <> OP_UNSHIPMENT) and (flowTypeOp <> OP_SHIPMENT) then begin
              umessages.Error('Внимание! Вагон: ' + CRLF +
                 VarToStr(dsBrowse.Dataset['WAGON_NO']) + CRLF +
                 'не может быть заявлен на вывод ввиду несоответствующей операции');
              continue;
           end;
           If VarToDate(dsBrowse.Dataset['F_OUT_CLAIM_DATE']) <> 0 then
              addToString(listClaimed, VarToStr(dsBrowse.Dataset['WAGON_NO']), ',');
        end;

        if listClaimed <> '' then begin
           if not umessages.QuestionNo('Вагоны:'#13#10 + listClaimed + #13#10'уже были заявлены на вывод.'
                  + #13#10'Установить новую дату ('+ DateToStr(SetupDateTime) + ' ' + TimeToStr(SetupDateTime)+') заявки на вывод') then
              exit;
        end;

        sqlSetClaim.Session         := Lsession;
        for i := 0 to dgrBrowse.MSelectedRows.Count-1 do begin
           dsBrowse.DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));

           sqlSetClaim.ParamByName('P_OUT_DATE').AsDateTime := SetupDateTime;
           sqlSetClaim.ParamByName('P_RW_WAGON_OPER_ID').AsInteger := VarToInt(dsBrowse.Dataset['RW_WAGON_OPER_ID'], 0);
           sqlSetClaim.Execute;

           err := sqlSetClaim.ParamByName('P_RESULT').AsString;
           if err <> '' then begin
              umessages.Error('Вагон: ' + VarToStr(dsBrowse.Dataset['WAGON_NO']) + '#13#10Ошибка: ' + err);
              sqlSetClaim.Session.Rollback;
              exit;
           end else
              sqlSetClaim.Session.Commit;
       end;
       UpdateQuery_Place(aPlaceNo);
       LockReleasePlace(aPlaceNo);
  end;
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.mnBackToWorkshop01Click(Sender: TObject);
  var i, locomotiveID, aPlaceNo: integer;
  var err, wagonList: string;
begin
  inherited;
  aPlaceNo := (Sender as TComponent).tag;

  with placeAbility[aPlaceNo].frPlace do begin
     if dgrBrowse.MSelectedRows.Count <= 0 then begin umessages.Error('Нет отмеченных записей'); exit; end;

     wagonList := '';
     for i := 0 to dgrBrowse.MSelectedRows.Count-1 do begin
        DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));
        if not tempOutput(DataSet) then
           addToString(wagonList, varToStr(DataSet['WAGON_NO']), ',');
     end;

     if wagonList <> '' then
        if not umessages.QuestionNo('Вагон(ы): '#13#10 + wagonList
                        + #13#10'временно не выводились из цеха(ов). Вернуть их обратно не получится.'
                        + #13#10'Продолжить'
          ) then  exit;

     if not checkTime then exit;
     if not umessages.QuestionNo('Будет установлено время возврата в цех: ' + DateToStr(SetupDateTime) + ' ' + TimeToStr(SetupDateTime)
                         + #13#10'Продолжить'
       ) then exit;

     locomotiveID := 0;
     BrowseRefParams.BrowseOptionSet := [boSelect];
     BrowseRefParams.DatePeriod.EndDate := Now();
     SelectService(BrowseRefParams,803);
     if BrowseRefParams.SDIResult = mrOk then
        locomotiveID := VarToInt(BrowseRefParams.DataSet['SERVICE_ID']);

     if locomotiveID <= 0 then    exit;

     wagonList := '';
     sqlWagonInto.Session := Lsession;
     for i := 0 to dgrBrowse.MSelectedRows.Count-1 do begin
         DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));
         if not tempOutput(DataSet) then continue;

         addToString(wagonList, varToStr(DataSet['RW_WAGON_LIST_ID']), ',');
         {}
         sqlWagonInto.ParamByName('P_PLACE_ID').AsInteger  :=  VarToInt(Dataset['ANCESTOR_PLACE_ID'], 0);
         sqlWagonInto.ParamByName('P_RW_WAGON_LIST_ID').AsInteger        := VarToInt(DataSet['RW_WAGON_LIST_ID'],0);
         sqlWagonInto.ParamByName('FACT_SHPT_DATE_BY_WSHOP').AsDateTime  := SetupDateTime;
         sqlWagonInto.ParamByName('P_NOTE').AsString                     := 'Возврат вагона в цех';
         sqlWagonInto.ParamByName('P_ANCESTOR_ID').AsInteger := VarToInt(Dataset['ANCESTOR_ID'], 0);
         sqlWagonInto.ParamByName('P_LOCOMOTIVE_SID').AsInteger := locomotiveID;
         sqlWagonInto.Execute;
         //upd := true;

         err := sqlWagonInto.ParamByName('P_Result').AsString;
         If err <> '' then begin
            umessages.Error('Внимание! ' + err);
            sqlWagonInto.Session.Rollback;
         end else begin
            sqlWagonInto.Session.Commit;
         end;
         {}
     end;

     if wagonList <> '' then begin
        UpdateAll_QueryPlaces();
        LockReleasePlace(aPlaceNo);
     end;

  end;
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.mnComplitOutputClick(Sender: TObject);
var i, aPlaceNo: integer;
var err, wagonList: string;
begin
  inherited;
  aPlaceNo := (Sender as TComponent).tag;

  with placeAbility[aPlaceNo].frPlace do begin
     if dgrBrowse.MSelectedRows.Count <= 0 then begin umessages.Error('Нет отмеченных записей'); exit;  end;

     wagonList := '';
     for i := 0 to dgrBrowse.MSelectedRows.Count-1 do begin
        DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));
        if not tempOutput(DataSet) then
           addToString(wagonList, varToStr(DataSet['WAGON_NO']), ',');
     end;

     if wagonList <> '' then
        if not umessages.QuestionNo('Вагон(ы): '#13#10 + wagonList
                        + #13#10'временно не выводились из цеха(ов). Изменить их состояние не получится.'
                        + #13#10'Продолжить'
          ) then exit;

     wagonList := '';
     sqlWagonFree.Session := Lsession;
     for i := 0 to dgrBrowse.MSelectedRows.Count-1 do begin
        DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));
        if not tempOutput(DataSet) then continue;

        // закрываем последнюю операцию, связанную с выводом вагона из цеха
        // также закрываем саму операцию погрузки, операция погрузки закрывается временем вывода вагона во вне
        sqlWagonFree.ParamByName('P_RW_WAGON_LIST_ID').AsInteger      := VarToInt(DataSet['RW_WAGON_LIST_ID']);
        sqlWagonFree.ParamByName('P_PREV_RW_WAGON_OPER_ID').AsInteger := VarToInt(Dataset['ANCESTOR_ID']);
        sqlWagonFree.Execute;

        err := sqlWagonFree.ParamByName('P_RESULT').AsString;
        If err <> '' then begin
           umessages.Error('Внимание! ' + err);
           sqlWagonFree.Session.Rollback;
        end else begin
           sqlWagonFree.Session.Commit;
           addToString(wagonList, varToStr(DataSet['RW_WAGON_LIST_ID']), ',');
        end;
     end;

     if wagonList <> '' then begin
        UpdateQuery_Place(aPlaceNo);
        LockReleasePlace(aPlaceNo);
     end;
  end;
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.cbBufferModeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := #0; exit;
end;

//=================================================================================================
{
                                          'ПРОИЗВОЛЬНЫЙ',
                                          'ЗАЯВЛЕННЫЕ НА ВЫВОД',
                                          'ПОД ПОГРУЗКОЙ',
                                          'ПОД ВЫГРУЗКОЙ',
                                          'ВРЕМЕННО ВЫВЕДЕННЫЕ',
                                          'ДОСТУПЕН ДЛЯ ВЫГРУЗКИ',
                                          'ДОСТУПЕН ДЛЯ ПОГРУЗКИ'
}
procedure TfmRwWagonDislocationEx.cbBufferModeChange(Sender: TObject);
var flowTypeOp: integer;
var listID: string;
var flag: boolean;
begin
  inherited;
  if flowBufferMode = cbBufferMode.Text then exit;
  flowBufferMode := cbBufferMode.Text;
  pMiddleLOW.Refresh;

  BrowseRefParams.Session.ExecSQL('delete from tmp_cache_table where var1 = ' + IntToStr(frSelectedList_2.tag),[]);
  BrowseRefParams.Session.Commit;
  frSelectedList_2.dgrBrowse.MSelectedRows.Clear();

  if flowBufferMode <> 'ПРОИЗВОЛЬНЫЙ' then begin

     LockWindowUpdate(frSelectedList_2.Handle);
     sqlGetChain.ParamByName('P_NAME_CACHE').AsString   := 'DSL';
     sqlGetChain.ParamByName('P_GRID_NUMBER').AsInteger := frSelectedList_2.tag;
     sqlGetChain.ParamByName('P_TIME_POINT').AsDateTime := Now();
     sqlGetChain.ParamByName('P_PLACE_ID').AsInteger    := 0;
     sqlGetChain.Execute;

     quPlace_4.close;
     quSelectMainPlaceLight.ParamByName('P_GRID_NUMBER').AsInteger := frSelectedList_2.tag;
     quPlace_4.MacroByName('MainSql').Value := quSelectMainPlaceLight.FinalSQL;
     quPlace_4.Params := quSelectMainPlaceLight.Params;
     quPlace_4.open;

     listID := '';
   with frSelectedList_2.dgrBrowse.DataSource do
     while not quPlace_4.Eof do begin

        if flowBufferMode = 'ЗАЯВЛЕННЫЕ НА ВЫВОД' then begin
          if VarToDate(DataSet['F_OUT_CLAIM_DATE']) <> 0 then begin
              flowTypeOp := typeOperation(DataSet);
              if (flowTypeOp = OP_UNSHIPMENT) or (flowTypeOp = OP_SHIPMENT) then
                 addToString(listID, varToStr(DataSet['RW_WAGON_OPER_ID']), ',');
          end;
        end;

        if flowBufferMode = 'ПОД ПОГРУЗКОЙ' then begin
           if (typeOperation(DataSet) = OP_SHIPMENT) then
              addToString(listID, varToStr(DataSet['RW_WAGON_OPER_ID']), ',');
        end;

        if flowBufferMode = 'ПОД ВЫГРУЗКОЙ' then begin
           if (typeOperation(DataSet) = OP_UNSHIPMENT) then
              addToString(listID, varToStr(DataSet['RW_WAGON_OPER_ID']), ',');
        end;

        if flowBufferMode = 'ВРЕМЕННО ВЫВЕДЕННЫЕ' then begin
           if tempOutput(DataSet) then
              addToString(listID, varToStr(DataSet['RW_WAGON_OPER_ID']), ',');
        end;

        if flowBufferMode = 'ДОСТУПЕН ДЛЯ ВЫГРУЗКИ' then begin
           if varToInt(DataSet['wagonState'],0) = 2 then
              addToString(listID, varToStr(DataSet['RW_WAGON_OPER_ID']), ',');
        end;

        if flowBufferMode = 'ДОСТУПЕН ДЛЯ ПОГРУЗКИ' then begin
          if varToInt(DataSet['wagonState'],0) = 3 then
              addToString(listID, varToStr(DataSet['RW_WAGON_OPER_ID']), ',');
        end;

        DataSet.Next;
     end;

     if listID = '' then listID := '0';
     BrowseRefParams.Session.ExecSQL('delete from tmp_cache_table where 1=1' +
         ' and objID not in (' + listID + ') ' +
         ' and var1 = ' + IntToStr(frSelectedList_2.tag),[]);
     BrowseRefParams.Session.Commit;
     LockWindowUpdate(0);
  end;

  flag := false;
  if flowBufferMode <> 'ПРОИЗВОЛЬНЫЙ' then begin
     if cbBufferAsFilter.Checked then begin cbBufferAsFilter.Checked := false; flag := true; end;
  end else begin
     if not cbBufferAsFilter.Checked then begin cbBufferAsFilter.Checked := true; flag := true; end;
  end;

  if not flag then
     Update_Local_QueryPlaces();

  // обновим грид буфера
  quPlace_4.close;
  quSelectMainPlaceLight.ParamByName('P_GRID_NUMBER').AsInteger := frSelectedList_2.tag;
  quPlace_4.MacroByName('MainSql').Value := quSelectMainPlaceLight.FinalSQL;
  quPlace_4.Params := quSelectMainPlaceLight.Params;
  quPlace_4.open;
  frSelectedList_2.acRefreshExecute(Sender);
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.cbBufferAsFilterClick(Sender: TObject);
begin
  inherited;
  Update_Local_QueryPlaces();
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
//   //
end;

//=================================================================================================
// подготовка подпунктов меню "Состав" и сопутствующих данных
var ListTrain00, ListTrain01, ListTrain02: TStringList;
procedure TfmRwWagonDislocationEx.pmBrowseState_1Popup(Sender: TObject);
var i,aPlaceNo: integer;
    frPlace: TfrSDIBrowse;
    newTrain, addTrain01, addTrain02: TMenuItem;
    str: string;
begin
  inherited;
  aPlaceNo := (Sender as TComponent).tag;

  newTrain := nil; addTrain01 := nil; addTrain02 := nil;
  case aPlaceNo of
       1: begin newTrain := newTrain_1; addTrain01 := addTrain01_1; addTrain02 := addTrain02_1; end;
       2: begin newTrain := newTrain_2; addTrain01 := addTrain01_2; addTrain02 := addTrain02_2; end;
       3: begin newTrain := newTrain_3; addTrain01 := addTrain01_3; addTrain02 := addTrain02_3; end;
  end;

  if ListTrain00 = nil then ListTrain00 := TStringList.Create;
  if ListTrain01 = nil then ListTrain01 := TStringList.Create;
  if ListTrain02 = nil then ListTrain02 := TStringList.Create;
  ListTrain00.Clear;
  ListTrain01.Clear;
  ListTrain02.Clear;

  newTrain.Enabled := false;
  addTrain01.visible := false;
  addTrain02.visible := false;

  frPlace := placeAbility[aPlaceNo].frPlace;
  if frPlace.dgrBrowse.MSelectedRows.Count = 0 then exit;

  newTrain.Enabled := true;

  // определим доступность режима добавления в состав: д.б. отмечены объекты ДВУХ разных составов
  for i := 0 to frPlace.dgrBrowse.MSelectedRows.Count-1 do begin
      frPlace.dsBrowse.DataSet.GotoBookmark(pointer(frPlace.dgrBrowse.MSelectedRows.Items[i]));
      str := VarToStr(frPlace.dsBrowse.Dataset['TRAIN_NUMBER']);
      if ListTrain00.IndexOf(str) < 0 then ListTrain00.Add(str);
      if ListTrain00.IndexOf(str) = 0 then ListTrain01.Add(VarToStr(frPlace.dsBrowse.Dataset['RW_WAGON_OPER_ID']));
      if ListTrain00.IndexOf(str) = 1 then ListTrain02.Add(VarToStr(frPlace.dsBrowse.Dataset['RW_WAGON_OPER_ID']));
  end;

  if ListTrain00.Count <> 2 then exit;

  addTrain01.visible := true;
  addTrain02.visible := true;

  addTrain01.Caption := 'Переставить <'+intToStr(ListTrain01.Count)+'> вагонов из состава <'+ListTrain00.Strings[0]+'> в состав <'+ListTrain00.Strings[1]+'>';
  addTrain02.Caption := 'Переставить <'+intToStr(ListTrain02.Count)+'> вагонов из состава <'+ListTrain00.Strings[1]+'> в состав <'+ListTrain00.Strings[0]+'>';
end;

//=================================================================================================
// подпункт "Новый" меню "Состав"
procedure TfmRwWagonDislocationEx.newTrain_1Click(Sender: TObject);
var i, aPlaceNo, flowID, min_number: integer;
    listSelectedID: string;
    frPlace: TfrSDIBrowse;
    flag: boolean;
begin
  inherited;

  // проверка возможности отмены делается автоматически, но лучше предупредить заранее
  if Length(rollBack) > 0 then begin
     if not
      umessages.QuestionNo(
        'Отмена текущих операций для данной точки будет невозможна после создание состава. Продолжить') then exit;
//     btRollback.Enabled := false;
//     rollBackStep := -1;
//     SetLength(rollBack,0);
  end;

  aPlaceNo := (Sender as TComponent).tag;

  frPlace := placeAbility[aPlaceNo].frPlace;
  LockWindowUpdate(frPlace.Handle);

  flowID := VarToInt(frPlace.dsBrowse.DataSet['Rw_Wagon_oper_ID'],0);
  listSelectedID := '';
  for i := 0 to frPlace.dgrBrowse.MSelectedRows.Count-1 do begin
      frPlace.dsBrowse.DataSet.GotoBookmark(pointer(frPlace.dgrBrowse.MSelectedRows.Items[i]));
      listSelectedID := listSelectedID + ',' + VarToStr(frPlace.dsBrowse.Dataset['RW_WAGON_OPER_ID']) + ',';
  end;

  if ListTrain00 = nil then ListTrain00 := TStringList.Create;
  ListTrain00.Clear;

  // найдем минимальный незанятый номер
  flag := true;
  min_number := 0;
  while flag do begin
    frPlace.dsBrowse.DataSet.first;
    while not frPlace.dsBrowse.DataSet.Eof do begin
      if VarToInt(frPlace.dsBrowse.Dataset['train_number'],0) = min_number then begin
         inc(min_number);
         flag := false;
         break;
      end;
      frPlace.dsBrowse.DataSet.Next;
    end;
    flag := not flag;
  end;

  for i := 0 to frPlace.dgrBrowse.MSelectedRows.Count-1 do begin
      frPlace.dsBrowse.DataSet.GotoBookmark(pointer(frPlace.dgrBrowse.MSelectedRows.Items[i]));
      ListTrain00.Add(VarToStr(frPlace.dsBrowse.Dataset['RW_WAGON_OPER_ID']));
  end;

  for i := 0 to ListTrain00.Count-1 do  setTrain(ListTrain00.Strings[i], intToStr(min_number));

  UpdateQuery_Place(aPlaceNo);
  LockReleasePlace(aPlaceNo);

  LockWindowUpdate(frPlace.Handle);
  restoreSelection(frPlace.dgrBrowse, listSelectedID, flowID);

  LockWindowUpdate(0);
end;

//=================================================================================================
procedure TfmRwWagonDislocationEx.setTrain(opID, train_number: string);
begin

  sqlSetTrain.Session := LSession;
  sqlSetTrain.ParamByName('P_TRAIN_NUMBER').AsInteger := StrToInt(train_number);
  sqlSetTrain.ParamByName('P_RW_WAGON_OPER_ID').AsInteger := StrToInt(opID);
  sqlSetTrain.ParamByName('P_TIME_POINT').AsDateTime := Now(); //GetDataTime(dtpDate_In.Date, dtpTime_In.Time);
  sqlSetTrain.Execute;

  if sqlSetTrain.ParamByName('P_RESULT').AsString <> '' then begin
     umessages.Error(sqlSetTrain.ParamByName('P_RESULT').AsString);
     sqlSetTrain.Session.Rollback;
  end;

end;

//=================================================================================================
// 'Прикрепить <'+intToStr(ListTrain01.Count)+'> вагонов из состава <'+ListTrain00.Strings[0]+'> к составу <'+ListTrain00.Strings[1]+'>';
procedure TfmRwWagonDislocationEx.addTrain01_1Click(Sender: TObject);
var i, aPlaceNo, flowID: integer;
    listSelectedID: string;
    frPlace: TfrSDIBrowse;
begin
  inherited;

  aPlaceNo := (Sender as TComponent).tag;
  frPlace := placeAbility[aPlaceNo].frPlace;

  flowID := VarToInt(frPlace.dsBrowse.DataSet['Rw_Wagon_oper_ID'],0);
  listSelectedID := '';
  for i := 0 to frPlace.dgrBrowse.MSelectedRows.Count-1 do begin
      frPlace.dsBrowse.DataSet.GotoBookmark(pointer(frPlace.dgrBrowse.MSelectedRows.Items[i]));
      listSelectedID := listSelectedID + ',' + VarToStr(frPlace.dsBrowse.Dataset['RW_WAGON_OPER_ID']) + ',';
  end;

  for i := 0 to ListTrain01.Count-1 do setTrain(ListTrain01.Strings[i], ListTrain00.Strings[1]);

  UpdateQuery_Place(aPlaceNo);
  LockReleasePlace(aPlaceNo);

  restoreSelection(frPlace.dgrBrowse, listSelectedID, flowID);

end;

//=================================================================================================
// 'Прикрепить <'+intToStr(ListTrain02.Count)+'> вагонов из состава <'+ListTrain00.Strings[1]+'> к составу <'+ListTrain00.Strings[0]+'>';
procedure TfmRwWagonDislocationEx.addTrain02_1Click(Sender: TObject);
var i, aPlaceNo, flowID: integer;
    listSelectedID: string;
    frPlace: TfrSDIBrowse;
begin
  inherited;

  aPlaceNo := (Sender as TComponent).tag;
  frPlace := placeAbility[aPlaceNo].frPlace;

  flowID := VarToInt(frPlace.dsBrowse.DataSet['Rw_Wagon_oper_ID'],0);
  listSelectedID := '';
  for i := 0 to frPlace.dgrBrowse.MSelectedRows.Count-1 do begin
      frPlace.dsBrowse.DataSet.GotoBookmark(pointer(frPlace.dgrBrowse.MSelectedRows.Items[i]));
      listSelectedID := listSelectedID + ',' + VarToStr(frPlace.dsBrowse.Dataset['RW_WAGON_OPER_ID']) + ',';
  end;

  for i := 0 to ListTrain02.Count-1 do setTrain(ListTrain02.Strings[i], ListTrain00.Strings[0]);

  UpdateQuery_Place(aPlaceNo);
  LockReleasePlace(aPlaceNo);

  restoreSelection(frPlace.dgrBrowse, listSelectedID, flowID);

end;

procedure TfmRwWagonDislocationEx.frSelectedList_2ToolButton11Click(
  Sender: TObject);
begin
  inherited;
  frSelectedList_2.acRefreshExecute(Sender);
end;

procedure TfmRwWagonDislocationEx.bCreateChainsClick(Sender: TObject);
begin
  inherited;

  If not uMessages.QuestionYes('Сформировать цепочки?') then exit;

  sqlCreateChains.Execute;
  uMessages.Information(  sqlCreateChains.ParamByName('P_RESULT').AsString);
end;

procedure TfmRwWagonDislocationEx.bRebuildChainClick(Sender: TObject);
begin
  inherited;

  If not uMessages.QuestionYes('Перестроить цепочки?') then exit;

  sqlRebuildChains.Execute;
  uMessages.Information(  sqlRebuildChains.ParamByName('P_RESULT').AsString);
end;


procedure TfmRwWagonDislocationEx.quPlace_1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

// заготовка под автоматический контроль необходимости обновления
procedure TfmRwWagonDislocationEx.tPlace1Timer(Sender: TObject);
begin
  inherited;
  if placeAbility[(Sender as TTimer).Tag].timeRefresh + (10/24/3600) > Now() then exit;

  if placeAbility[(Sender as TTimer).Tag].buttonRefresh.ImageIndex <> 8 then
     placeAbility[(Sender as TTimer).Tag].buttonRefresh.ImageIndex := 8
  else
     placeAbility[(Sender as TTimer).Tag].buttonRefresh.ImageIndex := 15;

end;

procedure TfmRwWagonDislocationEx.N26Click(Sender: TObject);
var i: integer;
    wagon_no: string;
    frPlace: TfrSDIBrowse;
var wagonList: TStringList;
begin
  inherited;

  frPlace := placeAbility[(Sender as TComponent).tag].frPlace;

  LockWindowUpdate(frPlace.Handle);

  frPlace.dgrBrowse.MSelectedRows.Clear;

  wagonList := TStringList.Create;
  for i := 1 to uStrUtils.WordCount(edSearhWagonNo.Text, [',']) do begin
      wagon_no := ExtractWord(i, edSearhWagonNo.Text, [',']);
      wagonList.Add(wagon_no);
  end;

  frPlace.DataSet.first;
  while not frPlace.DataSet.Eof do begin
     wagon_no := VarToStr(frPlace.Dataset['WAGON_NO']);
     if wagonList.IndexOf(wagon_no) >= 0 then begin
        frPlace.dgrBrowse.MSelectedRows.SetCurrentRowSelected(true);
     end;
     frPlace.DataSet.Next;
  end;

  LockWindowUpdate(0);
end;


procedure TfmRwWagonDislocationEx.N28Click(Sender: TObject);

type TWagonOrder = record
     wagon_no:   string;               // номер вагона
     operation_id:   integer;          // соответ. вагону операция
  end;

var wagonOrder: array of TWagonOrder;

var i, idx, sz, placeID, srcTag: integer;
    wagon_no: string;
    frPlace: TfrSDIBrowse;

var upd: boolean;
var wagonList: TStringList;
var res,hash_sour_before,hash_sour_after: string;
begin
  inherited;
//  uMessages.Information('В разработке');

  srcTag := (Sender as TComponent).tag;

  frPlace := placeAbility[srcTag].frPlace;
  LockWindowUpdate(frPlace.Handle);

  wagonList := TStringList.Create;
  for i := 1 to uStrUtils.WordCount(edSearhWagonNo.Text, [',']) do begin
      wagon_no := ExtractWord(i, edSearhWagonNo.Text, [',']);
      wagonList.Add(wagon_no);

      sz := Length(wagonOrder);
      SetLength(wagonOrder, sz + 1);
      wagonOrder[sz].wagon_no := wagon_no;
      wagonOrder[sz].operation_id := 0;
  end;

  // все отмеченные вагоны д.б. в строке поиска
  for i := 0 to frPlace.dgrBrowse.MSelectedRows.Count-1 do begin
      frPlace.dsBrowse.DataSet.GotoBookmark(pointer(frPlace.dgrBrowse.MSelectedRows.Items[i]));
      wagon_no := VarToStr(frPlace.dsBrowse.Dataset['WAGON_NO']);
      idx := wagonList.IndexOf(wagon_no);
      if idx < 0 then begin
         uMessages.Error('Вагон ' + wagon_no + ' отмечен, но отсутствует в строке поиска. Операция отменена');
         exit;
      end;
      wagonOrder[idx].operation_id := VarToInt(frPlace.dsBrowse.Dataset['RW_WAGON_OPER_ID'], 0);
  end;

  // все вагоны в строке поиска д.б. отмечены
  for i := 0 to Length(wagonOrder)-1 do begin
      if wagonOrder[i].operation_id = 0 then begin
         uMessages.Error('Вагон ' + wagonOrder[i].wagon_no + ' в строке поиска, но не отмечен. Операция отменена');
         exit;
      end;
  end;

  sqlGetTrainStatus.ParamByName('P_RW_WAGON_OPER_ID').AsInteger := wagonOrder[0].operation_id;
  sqlGetTrainStatus.ParamByName('P_TIMEPOINT').AsDateTime := now();
  sqlGetTrainStatus.Execute;

  if sqlGetTrainStatus.ParamByName('P_REAL_TRAIN_LENGTH').AsInteger <> frPlace.dgrBrowse.DataRowCount then begin
     uMessages.Error('На точке более одного состава! Операция отменена');
     exit;
  end;

  // первый вагон пропускаем, в результате упорядочивания он должен стать головным
  upd := false;
  placeID := placeAbility[srcTag].L_PLACE_STR_ID;
  hash_sour_before := getHash(placeID, now());
  for i := 1 to Length(wagonOrder)-1 do begin
     sqlMoveUpDown.ParamByName('P_SOUR_OP_ID').AsInteger := wagonOrder[i].operation_id;
     sqlMoveUpDown.ParamByName('P_DEST_OP_ID').AsInteger := wagonOrder[i-1].operation_id;
     sqlMoveUpDown.Execute;

     hash_sour_after  := getHash(placeID, now());
     res := sqlMoveUpDown.ParamByName('P_RESULT').AsString;

     if res <> '' then begin
         upd := true;
         rollbackProcess(internalRePosition,
         placeID,placeID,srcTag,srcTag,
           hash_sour_before + ':' + hash_sour_after,
           hash_sour_before + ':' + hash_sour_after,
           res
           );
         hash_sour_before := hash_sour_after;
     end;
  end;

 if upd then begin
    UpdateQuery_Place(srcTag);

    rollbackProcess(nextStep);

    // воcстановим отметки перенесенных вагонов
    frPlace.dgrBrowse.MSelectedRows.Clear;
    frPlace.DataSet.first;
    while not frPlace.DataSet.Eof do begin
       wagon_no := VarToStr(frPlace.Dataset['WAGON_NO']);
       if wagonList.IndexOf(wagon_no) >= 0 then begin
          frPlace.dgrBrowse.MSelectedRows.SetCurrentRowSelected(true);
       end;
       frPlace.DataSet.Next;
    end;
 end;

  LockWindowUpdate(0);
end;

procedure TfmRwWagonDislocationEx.SetReasonStr(str: string; aPlaceNo: integer);
var i: integer;
var list_id: string;
begin
  list_id := '';
  with placeAbility[aPlaceNo].frPlace do
    if dgrBrowse.MSelectedRows.Count > 0 then
       begin
          for i := 0 to dgrBrowse.MSelectedRows.Count - 1 do begin
            DataSet.GotoBookmark(pointer(dgrBrowse.MSelectedRows.Items[i]));
            addToString(list_id, VarToStr(dsBrowse.Dataset['RW_WAGON_OPER_ID']), ',');
          end;

          BrowseRefParams.Session.ExecSQL('update rw_wagon_operation set ADD_DISLOCATION_REASON = ''' + str + ''' where RW_WAGON_OPER_ID in (' +list_id + ')', []);
          BrowseRefParams.Session.Commit;

          dgrBrowse.MSelectedRows.Clear();
          acRefreshExecute(Self);
       end
    else
       uMessages.Error('Не отмечены вагоны для проведения операции');
end;

procedure TfmRwWagonDislocationEx.N30Click(Sender: TObject);
var i: integer;
var str: string;
var list: tstringList;
begin
  inherited;
  list:= TStringList.Create;
  for i := 0 to Length(reasonSet)-1 do list.Add(reasonSet[i]);

  str := iunsiRw.SetCauseStr(BrowseRefParams, 4, list);
  if str = '' then exit;

  SetReasonStr(str, (Sender as TComponent).tag);
end;


procedure TfmRwWagonDislocationEx.N36Click(Sender: TObject);
begin
  inherited;
  SetReasonStr('', (Sender as TComponent).tag);
end;

procedure TfmRwWagonDislocationEx.dgrBrowseColumns44NotInList(
  Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
  inherited;
  umessages.Information('Значение не из списка ' + NewText);
  Abort;
end;

procedure TfmRwWagonDislocationEx.bConvertBaseClick(Sender: TObject);
begin
  inherited;
  If not uMessages.QuestionYes('Преобразовать базу') then exit;

  sqlConvertBase.Execute;
  uMessages.Information(  sqlConvertBase.ParamByName('P_RESULT').AsString);
end;

procedure TfmRwWagonDislocationEx.bAddInnerWagonClick(Sender: TObject);
begin
  inherited;
  If not uMessages.QuestionYes('Добавить вагоны вн. парка') then exit;

  sqlAddInnerWagon.Execute;
  uMessages.Information(  sqlAddInnerWagon.ParamByName('P_RESULT').AsString);
end;

procedure TfmRwWagonDislocationEx.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
       //
end;

end.

