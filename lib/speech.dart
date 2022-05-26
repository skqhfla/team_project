import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'mainpage.dart';


class Speech {
  static final _speech = SpeechToText();

  static Future<bool> toggleRecording({
    required Function(String text) onResult,
  }) async {
    final isAvailable = await _speech.initialize();

    if (isAvailable) {
      _speech.listen(onResult:(value) => onResult(value.recognizedWords));
  }
    return isAvailable;
  }

}
