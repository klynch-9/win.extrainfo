unit unprogrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.ExtCtrls, cxCheckBox;

type
  TfrmUnproGrid = class(TForm)
    Panel1: TPanel;
    unproGrid: TcxGrid;
    view: TcxGridDBTableView;
    unproGridLevel1: TcxGridLevel;
    Panel2: TPanel;
    btnCancel: TcxButton;
    btnAdd: TcxButton;
    viewcol_data: TcxGridDBColumn;
    viewcol_id: TcxGridDBColumn;
    viewcol_name: TcxGridDBColumn;
    btnDelete: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    rowcount:integer;
    procedure loadgrid;
  end;

var
  frmUnproGrid: TfrmUnproGrid;

implementation

{$R *.dfm}

uses main,data,unproductive;


procedure TfrmUnproGrid.loadgrid;
begin
  with dm.qryUP do begin
    close;
    parameters[0].Value:=frmmain.id;
    open;
    rowcount:=dm.qryup.recordcount;
  end;
end;

procedure TfrmUnproGrid.btnAddClick(Sender: TObject);
begin
  with frmUnproductive do begin
    row:=rowcount+1;
    showmodal;
  end;
end;

procedure TfrmUnproGrid.btnCancelClick(Sender: TObject);
begin
 frmmain.Close;
end;

procedure TfrmUnproGrid.btnDeleteClick(Sender: TObject);
var col_row:integer;
begin
  col_row:=dm.qryUP.FieldByName('col_row').AsInteger;
  dm.deleteExtraInfo(2,col_row);
  loadgrid;
end;

procedure TfrmUnproGrid.FormShow(Sender: TObject);
begin
  loadgrid;
end;

end.


