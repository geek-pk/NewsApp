

import 'dart:developer';

debug(String message){
  log('[🍪] $message', );
}

warning(String message){
  log('[⚠️] $message', );
}

error(String message){
  log('[💥] $message', );
}

info(String message){
  log('[ℹ️] $message', );
}
