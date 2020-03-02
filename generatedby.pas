unit generatedby;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel;

type
  TfrmGeneratedBy = class(TForm)
    Panel1: TPanel;
    lblTemp1: TcxLabel;
    cbUsers: TcxComboBox;
    cxLabel1: TcxLabel;
    Panel3: TPanel;
    btnCancel: TcxButton;
    btnSave: TcxButton;
    btnUpdate: TcxButton;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadComboBox;
  public
    { Public declarations }
    row:integer;
  end;

var
  frmGeneratedBy: TfrmGeneratedBy;

implementation

{$R *.dfm}

uses main,data,orderinfo,gengrid;

procedure TfrmGeneratedBy.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmGeneratedBy.btnSaveClick(Sender: TObject);
begin
  dm.insertExtraInfo(3,37,row,cbUsers.Text);
  frmGenGrid.loadgrid;
  close;
end;

procedure TfrmGeneratedBy.btnUpdateClick(Sender: TObject);
begin
  dm.updateExtraInfo(cbUsers.Text,37,row);
  frmgengrid.loadgrid;
  close;
end;

procedure TfrmGeneratedBy.FormShow(Sender: TObject);
begin
  LoadComboBox;
end;

procedure TfrmGeneratedBy.LoadComboBox;
begin
  cbusers.Properties.Items.Clear;
  cbusers.Text:='-Select-';
  with dm.qry do begin
    close;
    sql.text:='select abbr+'' / ''+ name+'' / ''+convert(varchar,code) as [text] from labelfile where labeldefinition=''othertypes2'' and retired=''n''';
    open;
    while not eof do begin
      cbusers.Properties.Items.Add(fieldbyname('text').asstring);
      next;
    end;
  end;
end;

end.
