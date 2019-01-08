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
    //***Move fields from sales header to the table Gen. Journal Line
    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', true, true)]
    local procedure MyOnAfterCopyGenJnlLineFromSalesHeader(SalesHeader: Record "Sales Header"; VAR GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Source of Sales" := SalesHeader."Source Of Sales";
    end;
    //***Move fields from table Gen. Journal Line to table Customer Ledger entry
    // Option 1: CodeUnit 12 Gen.Jnl.-Post Line
    //LOCAL [IntegrationEvent] OnAfterInitCustLedgEntry(VAR CustLedgerEntry : Record "Cust. Ledger Entry";GenJournalLine : Record "Gen. Journal Line")
    //Option 2: Table 21 Cust. Ledger Entry
    //LOCAL [IntegrationEvent] OnAfterCopyCustLedgerEntryFromGenJnlLine(VAR CustLedgerEntry : Record "Cust. Ledger Entry";GenJournalLine : Record "Gen. Journal Line")
    //OnAfterCopyCustLedgerEntryFromGenJnlLine
    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure MyOnAfterCopyCustLedgerEntryFromGenJnlLine(VAR CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry."Source of Sales" := GenJournalLine."Source Of Sales";
        Message('source of sales is:%1', CustLedgerEntry."Source of Sales");
    end;
}