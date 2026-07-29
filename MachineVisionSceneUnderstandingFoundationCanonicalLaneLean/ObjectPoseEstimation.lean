import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

structure ObjectPoseEstimationPackage where
  rotationEstimation : Prop
  translationEstimation : Prop
  scaleEstimation : Prop
  poseConsistency : Prop

structure ObjectPoseEstimationEvidence (O : ObjectPoseEstimationPackage) where
  rotationEstimationClosed : O.rotationEstimation
  translationEstimationClosed : O.translationEstimation
  scaleEstimationClosed : O.scaleEstimation
  poseConsistencyClosed : O.poseConsistency

def ObjectPoseEstimationClosed (O : ObjectPoseEstimationPackage) : Prop :=
  O.rotationEstimation ∧ O.translationEstimation ∧
  O.scaleEstimation ∧ O.poseConsistency

theorem object_pose_estimation_closed_from_evidence (O : ObjectPoseEstimationPackage) (E : ObjectPoseEstimationEvidence O) : ObjectPoseEstimationClosed O := by
  exact And.intro E.rotationEstimationClosed
    (And.intro E.translationEstimationClosed
      (And.intro E.scaleEstimationClosed E.poseConsistencyClosed))

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse
