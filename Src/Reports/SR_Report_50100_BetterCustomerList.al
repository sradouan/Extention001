report 50100 BetterCustomerList
{
    UsageCategory = Lists;
    ApplicationArea = All;
    WordLayout = './Src/Reports/BetterCustomerList.docx';
    DefaultLayout = Word;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {

            }
            column(Name; Name)
            {

            }
            column(Address; Address)
            {

            }
        }
    }


}