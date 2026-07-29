import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure NavierStokesCapillarityPackage where
  velocityField : Type u
  pressureField : Type v
  viscousStressTensor : Type w
  incompressibilityCondition : Prop
  momentumEquation : Prop
  capillaryBoundaryCondition : Prop

structure NavierStokesCapillarityEvidence (N : NavierStokesCapillarityPackage) where
  incompressibilityConditionClosed : N.incompressibilityCondition
  momentumEquationClosed : N.momentumEquation
  capillaryBoundaryConditionClosed : N.capillaryBoundaryCondition

def NavierStokesCapillarityClosed (N : NavierStokesCapillarityPackage) : Prop :=
  N.incompressibilityCondition ∧ N.momentumEquation ∧ N.capillaryBoundaryCondition

theorem navier_stokes_capillarity_closed_from_evidence
    (N : NavierStokesCapillarityPackage) (E : NavierStokesCapillarityEvidence N) :
    NavierStokesCapillarityClosed N := by
  exact And.intro E.incompressibilityConditionClosed
    (And.intro E.momentumEquationClosed E.capillaryBoundaryConditionClosed)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse