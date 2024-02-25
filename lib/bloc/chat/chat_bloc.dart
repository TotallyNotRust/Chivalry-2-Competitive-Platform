import 'package:bloc/bloc.dart';
import 'package:c2cp/data_classes/chat_message.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<RecievedChat>(newChatRecieved);
  }
  
  Future newChatRecieved(RecievedChat event, Emitter<ChatState> emit) async {
    
  }
}
