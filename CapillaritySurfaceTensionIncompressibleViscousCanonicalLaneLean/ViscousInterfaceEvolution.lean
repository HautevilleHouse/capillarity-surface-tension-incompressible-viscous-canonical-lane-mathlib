import CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.SurfaceTensionBalance

/-!
# Viscous Interface Evolution Package
-/

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure ViscousInterfaceEvolutionPackage {G : SurfaceTensionBalancePackage}
    (F : CapillarityFlowPDEPackage G) where
  initialInterfaceRegular : Prop
  parabolicWellPosedness : Prop
  localExistenceInterval : Prop
  uniquenessOnOverlap : Prop
  smoothDependence : Prop

structure ViscousInterfaceEvolutionEvidence {G : SurfaceTensionBalancePackage}
    {F : CapillarityFlowPDEPackage G} (V : ViscousInterfaceEvolutionPackage F) where
  initialInterfaceRegularClosed : V.initialInterfaceRegular
  parabolicWellPosednessClosed : V.parabolicWellPosedness
  localExistenceIntervalClosed : V.localExistenceInterval
  uniquenessOnOverlapClosed : V.uniquenessOnOverlap
  smoothDependenceClosed : V.smoothDependence

def ViscousInterfaceEvolutionClosed {G : SurfaceTensionBalancePackage}
    {F : CapillarityFlowPDEPackage G} (V : ViscousInterfaceEvolutionPackage F) : Prop :=
  V.initialInterfaceRegular ∧
  V.parabolicWellPosedness ∧
  V.localExistenceInterval ∧
  V.uniquenessOnOverlap ∧
  V.smoothDependence

theorem viscous_interface_evolution_closed_from_evidence
    {G : SurfaceTensionBalancePackage} {F : CapillarityFlowPDEPackage G}
    (V : ViscousInterfaceEvolutionPackage F) (E : ViscousInterfaceEvolutionEvidence V) :
    ViscousInterfaceEvolutionClosed V := by
  exact And.intro E.initialInterfaceRegularClosed
    (And.intro E.parabolicWellPosednessClosed
      (And.intro E.localExistenceIntervalClosed
        (And.intro E.uniquenessOnOverlapClosed E.smoothDependenceClosed)))

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse