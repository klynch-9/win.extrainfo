unit ordgrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.ExtCtrls, cxGridCardView, cxGridDBCardView, cxGridCustomLayoutView;

type
  Tfrmordgrid = class(TForm)
    Panel1: TPanel;
    ordgrid: TcxGrid;
    ordgridLevel1: TcxGridLevel;
    Panel2: TPanel;
    btnCancel: TcxButton;
    btnAdd: TcxButton;
    btnEdit: TcxButton;
    ordgridDBCardView1: TcxGridDBCardView;
    ordgridDBCardView1temp1: TcxGridDBCardViewRow;
    ordgridDBCardView1temp2: TcxGridDBCardViewRow;
    ordgridDBCardView1temp3: TcxGridDBCardViewRow;
    ordgridDBCardView1Extra1: TcxGridDBCardViewRow;
    ordgridDBCardView1Extra2: TcxGridDBCardViewRow;
    ordgridDBCardView1Erap: TcxGridDBCardViewRow;
    ordgridDBCardView1Steers: TcxGridDBCardViewRow;
    ordgridDBCardView1Drives: TcxGridDBCardViewRow;
    ordgridDBCardView1Trailer: TcxGridDBCardViewRow;
    ordgridDBCardView1HazName: TcxGridDBCardViewRow;
    ordgridDBCardView1UN: TcxGridDBCardViewRow;
    ordgridDBCardView1PkgGroup: TcxGridDBCardViewRow;
    ordgridDBCardView1ph24hr: TcxGridDBCardViewRow;
    ordgridDBCardView1col_row: TcxGridDBCardViewRow;
    btnDelete: TcxButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);

  private
    procedure showvalues;
    { Private declarations }
  public
    { Public declarations }
    mode:integer;
  end;

var
  frmordgrid: Tfrmordgrid;

implementation

{$R *.dfm}

uses data,main,orderinfo,pfunc;

procedure Tfrmordgrid.btnAddClick(Sender: TObject);
begin
  with frmorderinfo do begin
    if dm.qryMain.Active then begin
      dm.qryMain.Last;
      row:=dm.qryMain.FieldByName('col_row').asinteger+1;
    end else frmorderinfo.row:=1;
    btnsave.visible:=true;
    btnupdate.visible:=false;
    showmodal;
  end;
  frmmain.loadorderinfo(frmmain.id);
end;

procedure Tfrmordgrid.btnCancelClick(Sender: TObject);
begin
  frmMain.Close;
end;

procedure Tfrmordgrid.btnDeleteClick(Sender: TObject);
var tab,row:integer;
begin
  row:=dm.qryMain.FieldByName('col_row').Asinteger;
  if MessageDlg('Do you wish to delete the selected group?' + #10#13 + '(if no, you can update values in the edit section)',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    dm.deleteExtraInfo(1,row);
  end;
  frmmain.loadorderinfo(frmmain.id);
end;

procedure Tfrmordgrid.btnEditClick(Sender: TObject);
begin
  with frmOrderInfo do begin
    showvalues;
    btnsave.visible:=false;
    btnupdate.visible:=true;
    ShowModal;
  end;
end;

procedure Tfrmordgrid.showvalues;
begin
  with frmOrderInfo do begin
    eTemp1.Text:=dm.qrymain.FieldByName('temp1').AsString;
    etemp2.Text:=dm.qrymain.FieldByName('temp2').AsString;
    etemp3.Text:=dm.qrymain.FieldByName('temp3').AsString;
    eExtra1.Text:=dm.qrymain.FieldByName('Extra1').AsString;
    eExtra2.Text:=dm.qrymain.FieldByName('Extra2').AsString;
    cbERAP.Text:=dm.qrymain.FieldByName('ERAP').AsString;
    eSteers.Text:=dm.qrymain.FieldByName('Steers').AsString;
    eDrives.Text:=dm.qrymain.FieldByName('Drives').AsString;
    eTrailer.Text:=dm.qrymain.FieldByName('Trailer').AsString;
    eHazName.Text:=dm.qrymain.FieldByName('HazName').AsString;
    eUN.Text:=dm.qrymain.FieldByName('UN').AsString;
    ePkgGroup.Text:=dm.qrymain.FieldByName('PkgGroup').AsString;
    e24hr.Text:=dm.qrymain.FieldByName('ph24hr').AsString;
    row:= dm.qrymain.FieldByName('col_row').Asinteger;
  end;
end;

end.
