import CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.ViscousInterfaceEvolution

/-!
# Capillarity Analytic Foundation
-/

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure CapillarityAnalyticFoundation where
  surfaceTension : SurfaceTensionBalancePackage
  surfaceTensionEvidence : SurfaceTensionBalanceEvidence surfaceTension
  flow : CapillarityFlowPDEPackage surfaceTension
  flowEvidence : CapillarityFlowPDEEvidence flow
  evolution : ViscousInterfaceEvolutionPackage flow
  evolutionEvidence : ViscousInterfaceEvolutionEvidence evolution

def CapillarityAnalyticFoundationClosed (A : CapillarityAnalyticFoundation) : Prop :=
  SurfaceTensionBalanceClosed A.surfaceTension ∧
  CapillarityFlowPDEClosed A.flow ∧
  ViscousInterfaceEvolutionClosed A.evolution

theorem capillarity_analytic_foundation_closed_from_evidence
    (A : CapillarityAnalyticFoundation) :
    CapillarityAnalyticFoundationClosed A := by
  exact And.intro (surface_tension_balance_closed_from_evidence A.surfaceTension A.surfaceTensionEvidence)
    (And.intro (capillarity_flow_pde_closed_from_evidence A.flow A.flowEvidence)
      (viscous_interface_evolution_closed_from_evidence A.evolution A.evolutionEvidence))

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse