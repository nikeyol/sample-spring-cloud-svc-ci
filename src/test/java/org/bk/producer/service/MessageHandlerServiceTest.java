package org.bk.producer.service;


import org.bk.producer.domain.Message;
import org.bk.producer.domain.MessageAcknowledgement;
import org.junit.Test;
import rx.Single;
import rx.observers.TestSubscriber;

import java.util.concurrent.TimeUnit;

//import static org.assertj.core.api.Assertions.*;

public class MessageHandlerServiceTest {

    @Test
    public void testMessageHandlerServiceNoDelay() {
        MessageHandlerService messageHandlerService = new MessageHandlerServiceImpl("test");
        Message msg = new Message("id", "payload", false, 0);
        Single<MessageAcknowledgement> ack = messageHandlerService.handleMessage(msg);

        TestSubscriber<MessageAcknowledgement> testSubscriber = new TestSubscriber<>();
        ack.subscribe(testSubscriber);
        testSubscriber.awaitTerminalEvent(2, TimeUnit.SECONDS);

        testSubscriber.assertCompleted();
        testSubscriber.assertValues(new MessageAcknowledgement("id", "payload", "test"));


    }

    @Test
    public void testMessageHandlerServiceWithDelay() {
        MessageHandlerService messageHandlerService = new MessageHandlerServiceImpl("test");
        Message msg = new Message("id", "payload", false, 100);
        Single<MessageAcknowledgement> ack = messageHandlerService.handleMessage(msg);

        TestSubscriber<MessageAcknowledgement> testSubscriber = new TestSubscriber<>();
        ack.subscribe(testSubscriber);
        testSubscriber.awaitTerminalEvent(2, TimeUnit.SECONDS);

        testSubscriber.assertCompleted();
        testSubscriber.assertValues(new MessageAcknowledgement("id", "payload", "test"));
    }

    @Test
    public void testMessageHandlerServiceWithException() {
        MessageHandlerService messageHandlerService = new MessageHandlerServiceImpl("test");
        Message msg = new Message("id", "payload", true, 100);
        Single<MessageAcknowledgement> ack = messageHandlerService.handleMessage(msg);

        TestSubscriber<MessageAcknowledgement> testSubscriber = new TestSubscriber<>();
        ack.subscribe(testSubscriber);
        testSubscriber.awaitTerminalEvent(2, TimeUnit.SECONDS);

        testSubscriber.assertError(Throwable.class);
    }
}
