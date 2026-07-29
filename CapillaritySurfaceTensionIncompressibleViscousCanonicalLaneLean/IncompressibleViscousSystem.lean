import HautevilleHouse.CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.SurfaceTensionAdmissible

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure IncompressibleViscousSystemPackage {C : CapillarityAdmittedObject} {S : SurfaceTensionPackage C} where
  navierStokesEquations : Prop
  incompressibilityConstraint : Prop
  viscosityParameter : Prop
  boundaryConditions : Prop

structure IncompressibleViscousSystemEvidence {C : CapillarityAdmittedObject} {S : SurfaceTensionPackage C} (N : IncompressibleViscousSystemPackage S) where
  navierStokesEquationsClosed : N.navierStokesEquations
  incompressibilityConstraintClosed : N.incompressibilityConstraint
  viscosityParameterClosed : N.viscosityParameter
  boundaryConditionsClosed : N.boundaryConditions

def IncompressibleViscousSystemClosed {C : CapillarityAdmittedObject} {S : SurfaceTensionPackage C} (N : IncompressibleViscousSystemPackage S) : Prop :=
  N.navierStokesEquations ∧ N.incompressibilityConstraint ∧ N.viscosityParameter ∧ N.boundaryConditions

theorem incompressible_viscous_system_closed_from_evidence {C : CapillarityAdmittedObject} {S : SurfaceTensionPackage C} (N : IncompressibleViscousSystemPackage S) (E : IncompressibleViscousSystemEvidence N) : IncompressibleViscousSystemClosed N := by
  exact And.intro E.navierStokesEquationsClosed (And.intro E.incompressibilityConstraintClosed (And.intro E.viscosityParameterClosed E.boundaryConditionsClosed))

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse