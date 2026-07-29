import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

structure ObjectDetectionModel where
  imageInput : Type u
  boundingBoxes : Type v
  classProbabilities : Type w
  objectnessScore : Prop

structure DetectionTrainingPipeline (D : ObjectDetectionModel) where
  anchorBoxPrior : Prop
  regressionLoss : Prop
  classificationLoss : Prop
  nonMaximumSuppression : Prop
  meanAveragePrecision : Prop

structure DetectionEvidence {D : ObjectDetectionModel} (P : DetectionTrainingPipeline D) where
  anchorBoxPriorClosed : P.anchorBoxPrior
  regressionLossClosed : P.regressionLoss
  classificationLossClosed : P.classificationLoss
  nonMaximumSuppressionClosed : P.nonMaximumSuppression
  meanAveragePrecisionClosed : P.meanAveragePrecision

def DetectionClosed {D : ObjectDetectionModel} (P : DetectionTrainingPipeline D) : Prop :=
  P.anchorBoxPrior ∧ P.regressionLoss ∧ P.classificationLoss ∧ P.nonMaximumSuppression ∧ P.meanAveragePrecision

theorem detection_closed_from_evidence {D : ObjectDetectionModel} (P : DetectionTrainingPipeline D) (E : DetectionEvidence P) : DetectionClosed P := by
  exact And.intro E.anchorBoxPriorClosed (And.intro E.regressionLossClosed (And.intro E.classificationLossClosed (And.intro E.nonMaximumSuppressionClosed E.meanAveragePrecisionClosed)))

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse