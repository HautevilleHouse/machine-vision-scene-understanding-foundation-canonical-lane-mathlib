import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

structure DepthEstimationPackage where
  stereoCorrespondence : Prop
  monocularDepthNet : Prop
  scaleConsistency : Prop
  depthMapResolution : Prop

def DepthEstimationClosed (D : DepthEstimationPackage) : Prop :=
  D.stereoCorrespondence ∧ D.monocularDepthNet ∧
  D.scaleConsistency ∧ D.depthMapResolution

structure DepthEstimationEvidence (D : DepthEstimationPackage) where
  stereoCorrespondenceClosed : D.stereoCorrespondence
  monocularDepthNetClosed : D.monocularDepthNet
  scaleConsistencyClosed : D.scaleConsistency
  depthMapResolutionClosed : D.depthMapResolution

theorem depth_estimation_closed_from_evidence (D : DepthEstimationPackage) (E : DepthEstimationEvidence D) :
    DepthEstimationClosed D := by
  exact And.intro E.stereoCorrespondenceClosed
    (And.intro E.monocularDepthNetClosed
      (And.intro E.scaleConsistencyClosed E.depthMapResolutionClosed))

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse