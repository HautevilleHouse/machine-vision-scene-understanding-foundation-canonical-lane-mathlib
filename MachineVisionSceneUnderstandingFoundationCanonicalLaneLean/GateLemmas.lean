import canonicalLaneMathlib.AdmissibleClass
import MachineVisionSceneUnderstandingFoundationCanonicalLaneLean.BridgeLemmas

/-!
# Gate Lemmas

Defines the gate condition for the machine vision scene understanding domain.
-/

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse