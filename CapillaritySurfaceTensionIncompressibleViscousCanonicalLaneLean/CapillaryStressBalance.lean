import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscous

structure CapillaryStressBalance where
  freeSurface : Type u
  curvature : Type v
  surfaceTension : Type w
  stressJump : Prop
  laplaceYoungEquation : Prop
  stressJumpClosed : stressJump
  laplaceYoungEquationClosed : laplaceYoungEquation

structure CapillaryStressBalanceEvidence (C : CapillaryStressBalance) where
  stressJumpClosed : C.stressJump
  laplaceYoungEquationClosed : C.laplaceYoungEquation

def CapillaryStressBalanceClosed (C : CapillaryStressBalance) : Prop :=
  C.stressJump ∧ C.laplaceYoungEquation

theorem capillary_stress_balance_closed_from_evidence
    (C : CapillaryStressBalance) (E : CapillaryStressBalanceEvidence C) :
    CapillaryStressBalanceClosed C := by
  exact And.intro E.stressJumpClosed E.laplaceYoungEquationClosed

end CapillaritySurfaceTensionIncompressibleViscous
end HautevilleHouse