import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Finset.Basic
import Mathlib.Data.Fin.VecNotation

/-!
# Scene Graph Objects Package

Defines the structural objects for machine vision scene understanding:
objects, relationships, and scene graphs.
-/

namespace HautevilleHouse
namespace MachineVisionSceneUnderstandingFoundationCanonicalLaneLean

structure SceneObject where
  objectId : Nat
  category : String
  boundingBox : (Float × Float × Float × Float) -- (x, y, width, height)
  attributes : Finset String
  confidence : Float

structure Relationship where
  subjectId : Nat
  predicate : String
  objectId : Nat
  confidence : Float

structure SceneGraph where
  objects : List SceneObject
  relationships : List Relationship
  imageId : String

structure SceneGraphEvidence (G : SceneGraph) where
  objectsNonEmpty : G.objects ≠ []
  relationshipsValid : ∀ (r : Relationship),
    r.subjectId ∈ G.objects.map (λ o => o.objectId) ∧
    r.objectId ∈ G.objects.map (λ o => o.objectId)
  boundingBoxesPos : ∀ (o : SceneObject),
    o.boundingBox.2.1 > 0 ∧ o.boundingBox.2.2.1 > 0

def SceneGraphClosed (G : SceneGraph) : Prop :=
  objectsNonEmpty G ∧ relationshipsValid G ∧ boundingBoxesPos G

theorem scene_graph_closed_from_evidence (G : SceneGraph) (E : SceneGraphEvidence G) :
    SceneGraphClosed G := by
  exact And.intro E.objectsNonEmpty
    (And.intro E.relationshipsValid E.boundingBoxesPos)

end MachineVisionSceneUnderstandingFoundationCanonicalLaneLean
end HautevilleHouse