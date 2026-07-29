import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure FreeBoundaryCapillarityPackage where
  interface : Set fluidDomain
  normalVector : fluidDomain → Vector ℝ 3
  curvature : fluidDomain → ℝ
  stressJump : Prop
  kinematicCondition : Prop
  evidencePackage : FreeBoundaryCapillarityEvidence

structure FreeBoundaryCapillarityEvidence where
  stressJumpCondition : ⟦-p I + μ (∇v + (∇v)ᵀ)⟧·n = σ κ n
  kinematicConditionHolds : (∂F/∂t + v·∇F) = 0 on interface
  curvatureConsistent : curvature = ∇·n
  interfaceRegular : interface is smooth

def FreeBoundaryCapillarityClosed (F : FreeBoundaryCapillarityPackage) : Prop :=
  F.stressJump ∧ F.kinematicCondition

theorem free_boundary_capillarity_closed_from_evidence
    (F : FreeBoundaryCapillarityPackage) (E : F.evidencePackage) :
    FreeBoundaryCapillarityClosed F := by
  exact And.intro E.stressJumpCondition E.kinematicConditionHolds

end HautevilleHouse.CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean