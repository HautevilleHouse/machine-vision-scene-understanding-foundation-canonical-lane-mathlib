import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

structure DepthEstimationModel where
  inputImage : Type u
  depthMap : Type v
  metricScale : Option Float
  photometricConsistency : Prop

structure DepthTrainingPipeline (D : DepthEstimationModel) where
  monocularDepthArchitecture : Prop
  photometricLoss : Prop
  smoothnessLoss : Prop
  scaleInvariantLoss : Prop
  absoluteRelativeErrorMetric : Prop

structure DepthEvidence {D : DepthEstimationModel} (P : DepthTrainingPipeline D) where
  monocularDepthArchitectureClosed : P.monocularDepthArchitecture
  photometricLossClosed : P.photometricLoss
  smoothnessLossClosed : P.smoothnessLoss
  scaleInvariantLossClosed : P.scaleInvariantLoss
  absoluteRelativeErrorMetricClosed : P.absoluteRelativeErrorMetric

def DepthClosed {D : DepthEstimationModel} (P : DepthTrainingPipeline D) : Prop :=
  P.monocularDepthArchitecture ∧ P.photometricLoss ∧ P.smoothnessLoss ∧ P.scaleInvariantLoss ∧ P.absoluteRelativeErrorMetric

theorem depth_closed_from_evidence {D : DepthEstimationModel} (P : DepthTrainingPipeline D) (E : DepthEvidence P) : DepthClosed P := by
  exact And.intro E.monocularDepthArchitectureClosed (And.intro E.photometricLossClosed (And.intro E.smoothnessLossClosed (And.intro E.scaleInvariantLossClosed E.absoluteRelativeErrorMetricClosed)))

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse