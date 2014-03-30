module ParsingGame.Foreign () where

import ParsingGame

import Control.Concurrent.MVar
import Foreign


foreign export ccall "parsingGameApplicationInit" foreignApplicationInit
  :: IO (StablePtr (MVar ApplicationState))
foreignApplicationInit = do
  maybeApplicationState <- applicationInit
  case maybeApplicationState of
    Nothing -> return $ castPtrToStablePtr nullPtr
    Just applicationStateMVar -> newStablePtr applicationStateMVar

foreign export ccall "parsingGameApplicationExit" foreignApplicationExit
  :: StablePtr (MVar ApplicationState) -> IO ()
foreignApplicationExit :: StablePtr (MVar ApplicationState) -> IO ()
foreignApplicationExit applicationStateMVarStablePtr = do
  applicationStateMVar <- deRefStablePtr applicationStateMVarStablePtr
  applicationExit applicationStateMVar
  freeStablePtr applicationStateMVarStablePtr
