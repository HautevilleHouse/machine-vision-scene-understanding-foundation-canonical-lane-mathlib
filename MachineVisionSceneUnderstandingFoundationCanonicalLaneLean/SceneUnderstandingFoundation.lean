import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

structure SceneUnderstandingFoundationPackage where
  sceneGraph : SceneGraphPackage
  depthEstimation : DepthEstimationPackage
  semanticSegmentation : SemanticSegmentationPackage
  multiObjectTracking : MultiObjectTrackingPackage
  spatialReasoning : SpatialReasoningPackage

def SceneUnderstandingFoundationClosed (P : SceneUnderstandingFoundationPackage) : Prop :=
  SceneGraphClosed P.sceneGraph ∧
  DepthEstimationClosed P.depthEstimation ∧
  SemanticSegmentationClosed P.semanticSegmentation ∧
  MultiObjectTrackingClosed P.multiObjectTracking ∧
  SpatialReasoningClosed P.spatialReasoning

structure SceneUnderstandingFoundationEvidence (P : SceneUnderstandingFoundationPackage) where
  sceneGraphEvidence : SceneGraphEvidence P.sceneGraph
  depthEstimationEvidence : DepthEstimationEvidence P.depthEstimation
  semanticSegmentationEvidence : SemanticSegmentationEvidence P.semanticSegmentation
  multiObjectTrackingEvidence : MultiObjectTrackingEvidence P.multiObjectTracking
  spatialReasoningEvidence : SpatialReasoningEvidence P.spatialReasoning

theorem scene_understanding_foundation_closed_from_evidence (P : SceneUnderstandingFoundationPackage) (E : SceneUnderstandingFoundationEvidence P) :
    SceneUnderstandingFoundationClosed P := by
  have hSC : SceneGraphClosed P.sceneGraph :=
    scene_graph_closed_from_evidence P.sceneGraph E.sceneGraphEvidence
  have hDE : DepthEstimationClosed P.depthEstimation :=
    depth_estimation_closed_from_evidence P.depthEstimation E.depthEstimationEvidence
  have hSS : SemanticSegmentationClosed P.semanticSegmentation :=
    semantic_segmentation_closed_from_evidence P.semanticSegmentation E.semanticSegmentationEvidence
  have hMT : MultiObjectTrackingClosed P.multiObjectTracking :=
    multi_object_tracking_closed_from_evidence P.multiObjectTracking E.multiObjectTrackingEvidence
  have hSR : SpatialReasoningClosed P.spatialReasoning :=
    spatial_reasoning_closed_from_evidence P.spatialReasoning E.spatialReasoningEvidence
  exact And.intro hSC (And.intro hDE (And.intro hSS (And.intro hMT hSR)))

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse