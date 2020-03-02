unit unproductive;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel, Vcl.ExtCtrls;

type
  TfrmUnproductive = class(TForm)
    Panel1: TPanel;
    lblTemp1: TcxLabel;
    cbReview: TcxComboBox;
    cxLabel1: TcxLabel;
    Panel3: TPanel;
    btnCancel: TcxButton;
    btnSave: TcxButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    row:integer;
  end;

var
  frmUnproductive: TfrmUnproductive;

implementation

uses main,data,orderinfo,unprogrid,pfunc;

{$R *.dfm}

procedure TfrmUnproductive.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmUnproductive.btnSaveClick(Sender: TObject);
begin
  dm.InsertExtraInfo(2,38,row,iif(cbReview.Text='Yes',1,0));
  frmUnprogrid.loadgrid;
  close;
end;

end.
