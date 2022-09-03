uint32_t cortos_writeMessages(CortosQueueHeader *hdr, uint8_t *msgs, uint32_t count) {
  uint8_t *dest = 0, *src = 0; // nullptr
  uint32_t process = count;
  uint32_t i;

  if (!(hdr->misc & SINGLE_RW_QUEUE)) {
    cortos_lock_acquire_buzy(hdr->lock);
  }
 //else {
 //     if (hdr->totalMsgs > 0) return 0; // write only when total msgs are zero
 // }

  uint32_t writeIndex     = hdr->writeIndex;
  uint32_t readIndex     = hdr->readIndex;
  uint32_t length         = hdr->length;
  uint32_t msgSizeInBytes = hdr->msgSizeInBytes;
  uint8_t* queuePtr       = (uint8_t*)(hdr + 1);

  uint32_t totalMsgs      = writeIndex - readIndex;

  while ((process > 0) && (totalMsgs < hdr->length)) {
    src  = msgs + (msgSizeInBytes * (count - process));
    dest = queuePtr + (msgSizeInBytes * writeIndex);
    for (i = 0; i < msgSizeInBytes; ++i) {
      *(dest+i) = *(src+i);                     // WRITE THE MESSAGE HERE
    }
    writeIndex = (writeIndex+1) % length;
    ++totalMsgs; --process;
  }

  hdr->writeIndex = writeIndex;
  //hdr->totalMsgs  = totalMsgs;

  if (!(hdr->misc & SINGLE_RW_QUEUE)) {
    cortos_lock_release(hdr->lock);
  }
  return (count - process);
}



uint32_t cortos_readMessagesNew(CortosQueueHeader *hdr, uint8_t *msgs, uint32_t count) {
  uint8_t *dest = 0, *src = 0; // nullptr
  uint32_t process = count;
  uint32_t i;

  //if (hdr->totalMsgs < count) return 0; // read only when there are messages

  if (!(hdr->misc & SINGLE_RW_QUEUE)) {
    cortos_lock_acquire_buzy(hdr->lock);
  }// else {
    //if (hdr->totalMsgs < count) return 0; // read only when there are messages
  //}

  //uint32_t totalMsgs      = hdr->totalMsgs;
  uint32_t readIndex      = hdr->readIndex;
  uint32_t writeIndex      = hdr->writeIndex;
  uint32_t length         = hdr->length;
  uint32_t msgSizeInBytes = hdr->msgSizeInBytes;
  uint8_t* queuePtr       = (uint8_t*)(hdr + 1);

  uint32_t totalMsgs      = writeIndex - readIndex;

  while ((process > 0) && (totalMsgs > 0)) {
    dest = msgs + (msgSizeInBytes * (count - process));
    src  = queuePtr + (msgSizeInBytes * readIndex);
    for (i = 0; i < msgSizeInBytes; ++i) {
      *(dest+i) = *(src+i);                     // READ THE MESSAGE HERE
    }
    readIndex = (readIndex+1) % length;
    --totalMsgs; --process;
  }

  hdr->readIndex  = readIndex;
  //hdr->totalMsgs  = totalMsgs;

  if (!(hdr->misc & SINGLE_RW_QUEUE)) {
    cortos_lock_release(hdr->lock);              // RELEASE LOCK
  }
  return (count - process);
}


