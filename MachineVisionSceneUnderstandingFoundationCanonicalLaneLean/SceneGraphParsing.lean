import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

structure SceneGraphPackage where
  objectDetection : Prop
  relationExtraction : Prop
  graphConstruction : Prop
  sceneComposition : Prop

structure SceneGraphEvidence (S : SceneGraphPackage) where
  objectDetectionClosed : S.objectDetection
  relationExtractionClosed : S.relationExtraction
  graphConstructionClosed : S.graphConstruction
  sceneCompositionClosed : S.sceneComposition

def SceneGraphClosed (S : SceneGraphPackage) : Prop :=
  S.objectDetection ∧ S.relationExtraction ∧ S.graphConstruction ∧ S.sceneComposition

theorem scene_graph_closed_from_evidence (S : SceneGraphPackage) (E : SceneGraphEvidence S) :
    SceneGraphClosed S := by
  exact And.intro E.objectDetectionClosed (And.intro E.relationExtractionClosed (And.intro E.graphConstructionClosed E.sceneCompositionClosed))

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse