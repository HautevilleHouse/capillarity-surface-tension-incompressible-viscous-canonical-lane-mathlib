import Mathlib.Topology.Basic

/-!
# Surface Tension Balance Package
-/

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure SurfaceTensionBalancePackage where
  fluidDomain : Type u
  topology : TopologicalSpace fluidDomain
  surfaceTension : Type v
  curvatureTensor : Type w
  balanceLaw : Type x
  smoothTwoFluidDomain : Prop
  surfaceTensionSmooth : Prop
  interfaceCurvatureLawful : Prop
  stressJumpCondition : Prop
  capillaryNumber : Prop

structure SurfaceTensionBalanceEvidence (G : SurfaceTensionBalancePackage) where
  smoothTwoFluidDomainClosed : G.smoothTwoFluidDomain
  surfaceTensionSmoothClosed : G.surfaceTensionSmooth
  interfaceCurvatureLawfulClosed : G.interfaceCurvatureLawful
  stressJumpConditionClosed : G.stressJumpCondition
  capillaryNumberClosed : G.capillaryNumber

def SurfaceTensionBalanceClosed (G : SurfaceTensionBalancePackage) : Prop :=
  G.smoothTwoFluidDomain ∧
  G.surfaceTensionSmooth ∧
  G.interfaceCurvatureLawful ∧
  G.stressJumpCondition ∧
  G.capillaryNumber

theorem surface_tension_balance_closed_from_evidence
    (G : SurfaceTensionBalancePackage) (E : SurfaceTensionBalanceEvidence G) :
    SurfaceTensionBalanceClosed G := by
  exact And.intro E.smoothTwoFluidDomainClosed
    (And.intro E.surfaceTensionSmoothClosed
      (And.intro E.interfaceCurvatureLawfulClosed
        (And.intro E.stressJumpConditionClosed E.capillaryNumberClosed)))

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse