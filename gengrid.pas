unit gengrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.ExtCtrls;

type
  TfrmGenGrid = class(TForm)
    Panel1: TPanel;
    view: TcxGridDBTableView;
    gengridLevel1: TcxGridLevel;
    gengrid: TcxGrid;
    Panel2: TPanel;
    btnCancel: TcxButton;
    btnAdd: TcxButton;
    viewcol_data: TcxGridDBColumn;
    viewcol_id: TcxGridDBColumn;
    viewcol_name: TcxGridDBColumn;
    btnEdit: TcxButton;
    btnDelete: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    rowcount:integer;
    procedure loadgrid;

  end;

var
  frmGenGrid: TfrmGenGrid;

implementation

uses data,main, generatedby;

{$R *.dfm}

procedure TfrmGenGrid.btnAddClick(Sender: TObject);
begin
  with frmgeneratedby  do begin
    row:=rowcount+1;
    btnSave.Visible:=true;
    btnUpdate.Visible:=false;
    showmodal;
  end;
end;

procedure TfrmGenGrid.btnCancelClick(Sender: TObject);
begin
  frmmain.Close;
end;

procedure TfrmGenGrid.btnDeleteClick(Sender: TObject);
var row:integer;
begin
  row:=dm.qryGen.FieldByName('col_row').Asinteger;
  dm.deleteExtraInfo(3,row);
  loadgrid;
end;

procedure TfrmGenGrid.btnEditClick(Sender: TObject);
begin
  with frmgeneratedby  do begin
    row:=dm.qryGen.FieldByName('col_row').Asinteger;
    btnSave.Visible:=false;
    btnUpdate.Visible:=true;
    showmodal;
  end;
end;

procedure TfrmGenGrid.FormShow(Sender: TObject);
begin
  loadgrid;
end;

procedure TfrmGenGrid.loadgrid;
begin
  with dm.qryGen do begin
    close;
    parameters[0].Value:=frmmain.id;
    open;
    rowcount:=dm.qrygen.recordcount;
  end;
end;

end.
