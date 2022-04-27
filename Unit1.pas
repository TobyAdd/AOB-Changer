unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uMSE;

type
  TMainForm = class(TForm)
    lbl1: TLabel;
    edtAOBCurent: TEdit;
    lbl2: TLabel;
    edtAOBModify: TEdit;
    ButtonReplace: TButton;
    pnl1: TPanel;
    pnl2: TPanel;
    ButtonAbout: TButton;
    GroupProcessAttach: TGroupBox;
    RadioWindowName: TRadioButton;
    RadioPID: TRadioButton;
    EditProcessAttach: TEdit;
    ButtonConnect: TButton;
    procedure ButtonConnectClick(Sender: TObject);
    procedure ButtonReplaceClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  SearchEngine: TMemorySearchEngine;
  SearchResult: TMSE_FindedAddress;
  end;

var
  MainForm: TMainForm;
  Window: HWND;
  ProcId: DWORD;


implementation

{$R *.dfm}


procedure TMainForm.ButtonConnectClick(Sender: TObject);
var
  Result: Boolean;
begin
if ButtonConnect.Caption = 'Connect' then begin
    begin
    if RadioWindowName.Checked = true then begin
    Window := FindWindowA(nil, PAnsiChar(AnsiString(EditProcessAttach.Text)));
    if Window = 0 then begin
    MessageDlg('Window not found!', mtError, [mbOK], 0);
    Exit;
    end;
    GetWindowThreadProcessId(Window, ProcId);
  end else begin
    ProcId := StrToInt(EditProcessAttach.Text);
  end;
  Result := ProcId <> 0;
  if Result then
  begin
    if SearchEngine = nil then
      SearchEngine := TMemorySearchEngine.Create;

    if not SearchEngine.OpenProcess(ProcId) then
    begin
      FreeAndNil(SearchEngine);
      MessageDlg('Failed to connect!',mtError, mbOKCancel, 0);
    end else begin
      ButtonConnect.Caption := 'Disconect';
      MainForm.Caption := 'AOB Changer | PID: ' + IntToStr(ProcId);
      edtAOBCurent.Enabled := true;
      edtAOBModify.Enabled := true;
      ButtonReplace.Enabled := True;
    end;
  end
  else
    FreeAndNil(SearchEngine);
  end;
end else begin
  MainForm.Caption := 'AOB Changer';
  ButtonConnect.Caption := 'Connect';
  edtAOBCurent.Enabled := False;
  edtAOBModify.Enabled := False;
  ButtonReplace.Enabled := False;
end;
end;

procedure TMainForm.ButtonReplaceClick(Sender: TObject);
var
  Search: TMemorySearch;
begin
  FreeAndNil(SearchResult);
  if SearchEngine <> nil then
    begin
      Search := SearchEngine.NewSearch(edtAOBCurent.Text);
      try
        Search.OPT_READPAGE_EXECUTEREADWRITE := True;
        Search.OPT_READPAGE_READWRITE := False;
        Search.OPT_READPAGE_EXECUTEREAD := True;
        Search.OPT_READPAGE_READONLY := False;

        if Search.Next then begin
          SearchResult := Search.GetFindedAddressObject;
          SearchResult.WriteHEX(0, edtAOBModify.Text);
          MessageDlg('Replaced', mtInformation, [mbOK],0);
          end
        else
          MessageDlg('Failed', mtError, [mbOK],0);
      finally
        Search.Free;
      end;
    end
  else
  MessageDlg('Process not found or not selected', mtError, [mbOK], 0);
end;

end.
