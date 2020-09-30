{- |
   Module     : Path.Dhall
   License    : MIT
   Stability  : experimental

Dhall instance for `Path`.
-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE RecordWildCards #-}
module Path.Dhall where

import Data.Aeson
import Dhall
import Dhall.Syntax
import Path

pathRelDir :: Decoder (Path Rel Dir)
pathRelDir = Decoder {..} where
  extract (TextLit (Chunks [] t)) = parseRelDir t
  expected = (Path Rel Dir)

instance FromDhall (Path Rel File)
instance FromDhall (Path Rel Dir)
instance ToDhall (Path Rel File)
instance ToDhall (Path Rel Dir)
