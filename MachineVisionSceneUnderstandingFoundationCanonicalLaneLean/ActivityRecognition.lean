import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

structure ActivityRecognitionPackage where
  temporalModeling : Prop
  interactionDetection : Prop
  sequenceSegmentation : Prop
  actionClassification : Prop

structure ActivityRecognitionEvidence (A : ActivityRecognitionPackage) where
  temporalModelingClosed : A.temporalModeling
  interactionDetectionClosed : A.interactionDetection
  sequenceSegmentationClosed : A.sequenceSegmentation
  actionClassificationClosed : A.actionClassification

def ActivityRecognitionClosed (A : ActivityRecognitionPackage) : Prop :=
  A.temporalModeling ∧ A.interactionDetection ∧
  A.sequenceSegmentation ∧ A.actionClassification

theorem activity_recognition_closed_from_evidence (A : ActivityRecognitionPackage) (E : ActivityRecognitionEvidence A) : ActivityRecognitionClosed A := by
  exact And.intro E.temporalModelingClosed
    (And.intro E.interactionDetectionClosed
      (And.intro E.sequenceSegmentationClosed E.actionClassificationClosed))

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse
