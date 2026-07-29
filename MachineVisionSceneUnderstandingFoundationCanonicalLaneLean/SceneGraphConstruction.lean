import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

structure SceneGraphPackage where
  objectDetector : Type u
  spatialRelations : Prop
  semanticLabels : Prop
  hierarchicalGraph : Prop
  sceneTopology : Prop

structure SceneGraphEvidence (S : SceneGraphPackage) where
  objectDetectorClosed : S.objectDetector
  spatialRelationsClosed : S.spatialRelations
  semanticLabelsClosed : S.semanticLabels
  hierarchicalGraphClosed : S.hierarchicalGraph
  sceneTopologyClosed : S.sceneTopology

def SceneGraphClosed (S : SceneGraphPackage) : Prop :=
  S.objectDetector ∧ S.spatialRelations ∧ S.semanticLabels ∧
  S.hierarchicalGraph ∧ S.sceneTopology

theorem scene_graph_closed_from_evidence (S : SceneGraphPackage) (E : SceneGraphEvidence S) :
    SceneGraphClosed S := by
  exact And.intro E.objectDetectorClosed
    (And.intro E.spatialRelationsClosed
      (And.intro E.semanticLabelsClosed
        (And.intro E.hierarchicalGraphClosed E.sceneTopologyClosed)))

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse