import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

structure DeepFeatureExtractionPackage where
  backboneNetwork : Type u
  featureMaps : Type v
  multiScaleRepresentation : Prop
  invarianceToPose : Prop
  invarianceToIllumination : Prop

structure DeepFeatureExtractionEvidence (F : DeepFeatureExtractionPackage) where
  multiScaleRepresentationClosed : F.multiScaleRepresentation
  invarianceToPoseClosed : F.invarianceToPose
  invarianceToIlluminationClosed : F.invarianceToIllumination

def DeepFeatureExtractionClosed (F : DeepFeatureExtractionPackage) : Prop :=
  F.multiScaleRepresentation ∧ F.invarianceToPose ∧ F.invarianceToIllumination

theorem deep_feature_extraction_closed_from_evidence (F : DeepFeatureExtractionPackage)
    (E : DeepFeatureExtractionEvidence F) : DeepFeatureExtractionClosed F := by
  exact And.intro E.multiScaleRepresentationClosed
    (And.intro E.invarianceToPoseClosed E.invarianceToIlluminationClosed)

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse