import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : VisionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  VisionWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse