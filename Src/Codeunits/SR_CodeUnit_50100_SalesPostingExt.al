codeunit 50100 MySalesPostMngt
{
    trigger OnRun()
    begin

    end;
    //Check mandatory fields before posting
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterCheckSalesDoc', '', true, true)]
    local procedure MyOnAfterCheckSalesDoc(VAR SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean)
    Begin
        With SalesHeader DO Begin
            IF "Document Type" <> "Document Type"::Order then
                exit;
            TestField("Source Of Sales"); 
        End;
    End;
    // add fields to item journal table
    [EventSubscriber(ObjectType::Table, Database::"Item Journal line", 'OnAfterCopyItemJnlLineFromSalesHeader', '', true, true)]
    local procedure MyOnAfterCopyItemJnlLineFromSalesHeader(VAR ItemJnlLine: Record "Item Journal Line"; SalesHeader: Record "Sales Header")
    begin
        ItemJnlLine."Source of Sales" := SalesHeader."Source Of Sales";
    end;
    // Add fields to item ledger entry
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure MyOnAfterInitItemLedgEntry(VAR NewItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; VAR ItemLedgEntryNo: Integer)
    begin
        NewItemLedgEntry."Source of Sales" := ItemJournalLine."Source of Sales";
    end;

    //OnAfterCopyGenJnlLineFromSalesHeader(SalesHeader,Rec); (table 81)
  //  LOCAL [IntegrationEvent] OnAfterCopyGenJnlLineFromSalesHeader(SalesHeader : Record "Sales Header";VAR GenJournalLine : Record "Gen. Journal Line")

}