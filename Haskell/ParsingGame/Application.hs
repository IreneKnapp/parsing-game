module ParsingGame.Application
  (Application,
   ApplicationState(..),
   applicationInit,
   applicationExit)
  where

import Control.Concurrent.MVar
import Control.Monad.Trans.State


data ApplicationState = ApplicationState

type Application = StateT ApplicationState IO


applicationInit :: IO (Maybe (MVar ApplicationState))
applicationInit = do
  applicationStateMVar <- newMVar ApplicationState
  return $ Just applicationStateMVar


applicationExit :: MVar ApplicationState -> IO ()
applicationExit applicationStateMVar = do
  _ <- takeMVar applicationStateMVar
  return ()
