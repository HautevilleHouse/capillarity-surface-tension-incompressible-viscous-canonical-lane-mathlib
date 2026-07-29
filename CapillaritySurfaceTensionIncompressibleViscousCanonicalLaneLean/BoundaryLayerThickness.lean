import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure BoundaryLayerThicknessPackage where
  viscosity : ℝ
  freeStreamVelocity : ℝ
  streamwiseDistance : ℝ
  boundaryLayerProfileSatisfiesBlasius : Prop
  displacementThicknessComputed : Prop
  momentumThicknessComputed : Prop

structure BoundaryLayerThicknessEvidence (B : BoundaryLayerThicknessPackage) where
  boundaryLayerProfileSatisfiesBlasiusClosed : B.boundaryLayerProfileSatisfiesBlasius
  displacementThicknessComputedClosed : B.displacementThicknessComputed
  momentumThicknessComputedClosed : B.momentumThicknessComputed

def BoundaryLayerThicknessClosed (B : BoundaryLayerThicknessPackage) : Prop :=
  B.boundaryLayerProfileSatisfiesBlasius ∧ B.displacementThicknessComputed ∧ B.momentumThicknessComputed

theorem boundary_layer_thickness_closed_from_evidence
    (B : BoundaryLayerThicknessPackage) (E : BoundaryLayerThicknessEvidence B) :
    BoundaryLayerThicknessClosed B := by
  exact And.intro E.boundaryLayerProfileSatisfiesBlasiusClosed
    (And.intro E.displacementThicknessComputedClosed E.momentumThicknessComputedClosed)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse
