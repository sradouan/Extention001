tableextension 50100 "Sales Header Extension" extends "Sales Header"
{

    fields
    {
        field(50000; "Source Of Sales"; Code[20])
        {
            TableRelation = "Source of Sales".Code where (Blocked = const (false));
        }

    }

}