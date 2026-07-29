import canonicalLaneMathlib.AdmissibleClass
import MachineVisionSceneUnderstandingFoundationCanonicalLaneLean.SceneGraphObjects
import MachineVisionSceneUnderstandingFoundationCanonicalLaneLean.SemanticSegmentation
import MachineVisionSceneUnderstandingFoundationCanonicalLaneLean.ObjectDetection

/-!
# Scene Parsing Package

Defines holistic scene parsing: combines detection, segmentation, and relationships.
-/

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

structure SceneParsingResult where
  sceneGraph : SceneGraph
  segmentationMap : SegmentationMap
  detectionResult : DetectionResult

structure SceneParserModel where
  segmentationModel : SegmentationModel
  detectorModel : DetectorModel
  fusionMethod : String

structure SceneParsingEvidence (P : SceneParserModel) where
  segmentationClosed : SegmentationClosed P.segmentationModel
  detectorClosed : DetectorClosed P.detectorModel
  fusionMethodKnown : P.fusionMethod ∈ ["Concatenation", "Attention", "GraphNet"]

def SceneParsingClosed (P : SceneParserModel) : Prop :=
  SegmentationClosed P.segmentationModel ∧
  DetectorClosed P.detectorModel ∧
  P.fusionMethod ∈ ["Concatenation", "Attention", "GraphNet"]

theorem scene_parsing_closed_from_evidence (P : SceneParserModel)
    (E : SceneParsingEvidence P) : SceneParsingClosed P := by
  exact And.intro E.segmentationClosed
    (And.intro E.detectorClosed E.fusionMethodKnown)

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse