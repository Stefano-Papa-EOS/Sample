# Method 2 - Interface

This method is called the interface method, because we will implement the interface `EOS004 IProcQueueProcessor` and write custom processing logic.

This method is cleaner, but requires a bit more work because you need to
- Write a Codeunit that implements `EOS004 IProcQueueProcessor` and provides the processing logic
- Create an enum extension on `Enum "EOS004 Proc. Queue Processor"` for your newly created interface implementation
- Whenever a queue entry is created, the processor needs to be specified. Alternatively you can subscribe to the event `OnGetGetDefaultProcessor` of `table 18122321 "EOS004 Proc. Queue Entry"` to provide your processor as a default, based on the category.