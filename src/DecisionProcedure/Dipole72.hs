module DecisionProcedure.Dipole72 () where

-- standard modules
import Data.Maybe
import qualified Data.Set as Set

-- local modules
import Basics
import Calculus.Dipole72
import Convert
import DecisionProcedure

str = "dra-72"

toAtomicFlipFlops (a,fun) = (a, newFun)
  where
    newFun net = case dpNet net of
       Just x  -> fun x
       Nothing -> Just False
    dpNet net = dipolesToFlipFlops $ makeAtomic net

instance HasDecisionProcedure Dipole72 where
    proceduresForAtomicNets _ =
        [ algebraicClosure str
        , algebraicReasoning str
        , toAtomicFlipFlops triangleConsistency
        , toAtomicFlipFlops chirotopeSloppy
        , toAtomicFlipFlops biquadraticFinalPolynomialsSloppy
        , toAtomicFlipFlops chirotope
        , toAtomicFlipFlops biquadraticFinalPolynomials
        ]

    proceduresForNonAtomicNets _ =
        [ algebraicClosure str
        , algebraicReasoning str
        ]
