tableextension 50101 "Sales Invoice Header Extension" extends "Sales Invoice Header"
{
    fields
    {
        field(50000; "Source Of Sales"; Code[20])
        {
            TableRelation = "Source of Sales".Code where (Blocked = const (false));
            Editable=false;
        }
    }

    var
        myInt: Integer;
}