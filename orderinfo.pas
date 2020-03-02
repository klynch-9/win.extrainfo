unit orderinfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, Vcl.StdCtrls, cxLabel, cxButtons, Vcl.ExtCtrls;

type
  TfrmOrderInfo = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    lblTemp1: TcxLabel;
    eTemp1: TEdit;
    lbltemp2: TcxLabel;
    eTemp2: TEdit;
    lbltemp3: TcxLabel;
    eTemp3: TEdit;
    cxLabel1: TcxLabel;
    eExtra1: TEdit;
    cxLabel2: TcxLabel;
    eExtra2: TEdit;
    cxLabel3: TcxLabel;
    eSteers: TEdit;
    cxLabel4: TcxLabel;
    eTrailer: TEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    eHazName: TEdit;
    cxLabel7: TcxLabel;
    eUN: TEdit;
    cxLabel8: TcxLabel;
    ePkgGroup: TEdit;
    cxLabel9: TcxLabel;
    e24hr: TEdit;
    cxLabel10: TcxLabel;
    eDrives: TEdit;
    cbERAP: TcxComboBox;
    btnCancel: TcxButton;
    btnSave: TcxButton;
    btnUpdate: TcxButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Save;
    procedure clearForm;
    procedure Insert;
  public
    { Public declarations }
    row:integer;
  end;

var
  frmOrderInfo: TfrmOrderInfo;

implementation

uses main,data,pfunc;

{$R *.dfm}

procedure TfrmOrderInfo.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmOrderInfo.btnSaveClick(Sender: TObject);
begin
  insert;
  frmmain.loadOrderInfo(frmmain.id);
  close;
end;

procedure TfrmOrderInfo.btnUpdateClick(Sender: TObject);
begin
  Save;
  frmmain.loadOrderInfo(frmmain.id);
  close;
end;

procedure TfrmOrderInfo.clearForm;
begin
  eTemp1.Text:='';
  etemp2.Text:='';
  etemp3.Text:='';
  eExtra1.Text:='';
  eExtra2.Text:='';
  cbERAP.Text:='';
  eSteers.Text:='';
  eDrives.Text:='';
  eTrailer.Text:='';
  eHazName.Text:='';
  eUN.Text:='';
  ePkgGroup.Text:='';
  e24hr.Text:='';
end;

procedure TfrmOrderInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   clearform;
end;

procedure TfrmOrderInfo.Save;
begin
  dm.updateextrainfo(etemp1.Text,7,row);
  dm.updateextrainfo(etemp2.Text,8,row);
  dm.updateextrainfo(etemp3.Text,9,row);
  dm.updateextrainfo(eExtra1.Text,12,row);
  dm.updateextrainfo(eextra2.Text,13,row);
  dm.updateextrainfo(iif(cbERAP.Text='-select-','',cberap.text),14,row);
  dm.updateextrainfo(eSteers.Text,15,row);
  dm.updateextrainfo(eDrives.Text,16,row);
  dm.updateextrainfo(eTrailer.Text,17,row);
  dm.updateextrainfo(eHazName.Text,18,row);
  dm.updateextrainfo(eUN.Text,19,row);
  dm.updateextrainfo(ePkgGroup.Text,20,row);
  dm.updateextrainfo(e24hr.Text,21,row);
end;

procedure TfrmOrderInfo.Insert;
begin
  dm.insertextrainfo(1,7,row,etemp1.Text);
  dm.insertextrainfo(1,8,row,etemp2.Text);
  dm.insertextrainfo(1,9,row,etemp3.Text);
  dm.insertextrainfo(1,12,row,eExtra1.Text);
  dm.insertextrainfo(1,13,row,eExtra2.Text);
  dm.insertextrainfo(1,14,row,iif(cbERAP.Text='-select-','',cberap.text));
  dm.insertextrainfo(1,15,row,esteers.Text);
  dm.insertextrainfo(1,16,row,edrives.Text);
  dm.insertextrainfo(1,17,row,etrailer.Text);
  dm.insertextrainfo(1,18,row,ehazname.Text);
  dm.insertextrainfo(1,19,row,eun.Text);
  dm.insertextrainfo(1,20,row,ePkgGroup.Text);
  dm.insertextrainfo(1,21,row,e24hr.Text);
end;

end.
