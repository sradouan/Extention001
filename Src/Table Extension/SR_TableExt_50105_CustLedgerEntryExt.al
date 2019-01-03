tableextension 50105 "Cust. Ledger Entry Extension" extends "Cust. Ledger Entry"
{
    fields
    {
        field(50000; "Source of Sales"; code[20])
        {
            
            TableRelation = "Source of Sales".Code where (Blocked = const (false));
            Editable = false;

        }
    }

}