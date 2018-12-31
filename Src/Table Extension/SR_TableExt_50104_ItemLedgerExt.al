tableextension 50104 "Item Ledger Entry Extension" extends "Item Ledger Entry"
{
    fields
    {
        field(50000; "Source of Sales"; code[20])
        {
            //DataClassification = ToBeClassified;
            TableRelation = "Source of Sales".Code where (Blocked = const (false));
            Editable = false;

        }
    }

    var
        myInt: Integer;
}