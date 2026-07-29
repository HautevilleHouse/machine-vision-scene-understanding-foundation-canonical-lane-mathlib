import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

structure MultiObjectTrackingPackage where
  detectionAssociation : Prop
  motionModel : Prop
  appearanceReid : Prop
  trackLifecycle : Prop
  occlusionHandling : Prop

def MultiObjectTrackingClosed (M : MultiObjectTrackingPackage) : Prop :=
  M.detectionAssociation ∧ M.motionModel ∧ M.appearanceReid ∧
  M.trackLifecycle ∧ M.occlusionHandling

structure MultiObjectTrackingEvidence (M : MultiObjectTrackingPackage) where
  detectionAssociationClosed : M.detectionAssociation
  motionModelClosed : M.motionModel
  appearanceReidClosed : M.appearanceReid
  trackLifecycleClosed : M.trackLifecycle
  occlusionHandlingClosed : M.occlusionHandling

theorem multi_object_tracking_closed_from_evidence (M : MultiObjectTrackingPackage) (E : MultiObjectTrackingEvidence M) :
    MultiObjectTrackingClosed M := by
  exact And.intro E.detectionAssociationClosed
    (And.intro E.motionModelClosed
      (And.intro E.appearanceReidClosed
        (And.intro E.trackLifecycleClosed E.occlusionHandlingClosed)))

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse