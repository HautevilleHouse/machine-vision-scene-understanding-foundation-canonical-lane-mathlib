import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

structure SemanticSegmentationClosurePackage where
  pixelLabels : Type u
  classPredictions : Type v
  boundaryFidelity : Prop
  classBalancedAccuracy : Prop
  panopticQuality : Prop

structure SemanticSegmentationClosureEvidence (S : SemanticSegmentationClosurePackage) where
  boundaryFidelityClosed : S.boundaryFidelity
  classBalancedAccuracyClosed : S.classBalancedAccuracy
  panopticQualityClosed : S.panopticQuality

def SemanticSegmentationClosureClosed (S : SemanticSegmentationClosurePackage) : Prop :=
  S.boundaryFidelity ∧ S.classBalancedAccuracy ∧ S.panopticQuality

theorem semantic_segmentation_closure_closed_from_evidence (S : SemanticSegmentationClosurePackage)
    (E : SemanticSegmentationClosureEvidence S) : SemanticSegmentationClosureClosed S := by
  exact And.intro E.boundaryFidelityClosed
    (And.intro E.classBalancedAccuracyClosed E.panopticQualityClosed)

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse