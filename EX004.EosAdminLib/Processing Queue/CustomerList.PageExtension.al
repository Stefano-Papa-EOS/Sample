pageextension 50100 CustomerList extends "Customer List"
{

    actions
    {
        addlast(processing)
        {
            action(Method1)
            {
                ApplicationArea = All;
                Caption = 'Method 1';

                trigger OnAction()
                var
                    Rec2: Record Customer;
                begin
                    CurrPage.SetSelectionFilter(Rec2);
                    CreateEntries_Method1(Rec2);
                end;
            }
            action(Method2)
            {
                ApplicationArea = All;
                Caption = 'Method 1';

                trigger OnAction()
                var
                    Rec2: Record Customer;
                begin
                    CurrPage.SetSelectionFilter(Rec2);
                    CreateEntries_Method2(Rec2);
                end;
            }
        }
    }


    procedure CreateEntries_Method1(var Customer: Record Customer)
    var
        QueueEntry: Record "EOS004 Proc. Queue Entry";
        method1: Codeunit Mailing_Method1;
    begin
        if (Customer.FindSet()) then
            repeat
                QueueEntry.CreateEntry(
                    // The 'category' helps to identify what kind of entry this is.
                    // This category is optional when using the "interface-driven" method because it doesn't really matter.
                    // You should however use a meaningful name because it helps grouping the entries that belong together.
                    method1.CategoryName(),
                    // Give us a record ID as context.
                    // This may be optional for you, but it is a good practice always provide one.
                    Customer,
                    // For the interface-driven method, the "processor" parameter is essential.
                    // This idendifies the processor with which this entry will be processed.
                    Enum::"EOS004 Proc. Queue Processor"::"Customer Mailing Method1"
                );
            until Customer.Next() = 0;
    end;

    procedure CreateEntries_Method2(var Customer: Record Customer)
    var
        QueueEntry: Record "EOS004 Proc. Queue Entry";
        method2: Codeunit Mailing_Method2;
    begin
        if (Customer.FindSet()) then
            repeat
                QueueEntry.CreateEntry(
                    // The 'category' helps to identify what kind of entry this is.
                    // This category is essential when using the "event-driven" method because this is the primary field with which you will
                    // identify if your event subscriber should react.
                    method2.CategoryName(),
                    // Give us a record ID as context.
                    // This may be optional for you, but it is a good practice always provide one.
                    Customer);

            // For the event-driven method, we don't need to explicitly specify the processor.
            // This is because, if not otherwise specified, the default processor will be used, and the default processor is the event-driven one.

            until Customer.Next() = 0;
    end;

}