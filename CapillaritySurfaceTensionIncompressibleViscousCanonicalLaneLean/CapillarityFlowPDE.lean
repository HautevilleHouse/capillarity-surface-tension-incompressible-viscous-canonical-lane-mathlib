import CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.SurfaceTensionBalance

/-!
# Capillarity Flow PDE Package
-/

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure CapillarityFlowPDEPackage (G : SurfaceTensionBalancePackage) where
  timeParameter : Type u
  interfaceAt : timeParameter -> Type v
  initialInterfaceMatches : Prop
  differentiableInterfaceFamily : Prop
  navierStokesCapillaryEquation : Prop
  maximalTimeInterval : Prop

structure CapillarityFlowPDEEvidence {G : SurfaceTensionBalancePackage}
    (F : CapillarityFlowPDEPackage G) where
  initialInterfaceMatchesClosed : F.initialInterfaceMatches
  differentiableInterfaceFamilyClosed : F.differentiableInterfaceFamily
  navierStokesCapillaryEquationClosed : F.navierStokesCapillaryEquation
  maximalTimeIntervalClosed : F.maximalTimeInterval

def CapillarityFlowPDEClosed {G : SurfaceTensionBalancePackage}
    (F : CapillarityFlowPDEPackage G) : Prop :=
  F.initialInterfaceMatches ∧
  F.differentiableInterfaceFamily ∧
  F.navierStokesCapillaryEquation ∧
  F.maximalTimeInterval

theorem capillarity_flow_pde_closed_from_evidence
    {G : SurfaceTensionBalancePackage} (F : CapillarityFlowPDEPackage G)
    (E : CapillarityFlowPDEEvidence F) : CapillarityFlowPDEClosed F := by
  exact And.intro E.initialInterfaceMatchesClosed
    (And.intro E.differentiableInterfaceFamilyClosed
      (And.intro E.navierStokesCapillaryEquationClosed E.maximalTimeIntervalClosed))

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse