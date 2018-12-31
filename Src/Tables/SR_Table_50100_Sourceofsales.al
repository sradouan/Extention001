table 50100 "Source of Sales"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; code; code[20])
        {
            DataClassification = CustomerContent;

        }
        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;

        }
        field(3; Blocked; Boolean)
        {
            DataClassification = CustomerContent;

        }
        field(4; "Last Modified Date Time"; DateTime)
        {
            DataClassification = CustomerContent;
            Editable = False;


        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        UpdateLastDateTimeModified;
    end;

    trigger OnModify()
    begin
        UpdateLastDateTimeModified;
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin
        UpdateLastDateTimeModified;
    end;

    local procedure UpdateLastDateTimeModified()
    var
        myInt: Integer;
    begin
        "Last Modified Date Time" := CurrentDateTime();

    end;

}