import canonicalLaneMathlib.AdmissibleClass
import MachineVisionSceneUnderstandingFoundationCanonicalLaneLean.SceneGraphObjects

/-!
# Bridge Lemmas

Defines the bridge condition for the machine vision scene understanding domain.
-/

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SceneGraphClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse