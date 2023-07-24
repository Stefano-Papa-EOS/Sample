# Method 2 - Event Driven

This method is called the event driven method, because it uses the same processor for each and every proc. queue entry.

This processor is the default processor that ships with EOS Administration Library: `18122342 "EOS004 Proc. Queue - Default"`. This processor does not have any business logic at all, it just raises the event `OnProcessEntry` that you can subscribe to. In this event you can then check if you should process the given entry, and in that case handle it.

If no handler at all reacts, the entry willbe marked as failed.

This method requires less work because all you need to do is write an event subscriber that handles your entries.