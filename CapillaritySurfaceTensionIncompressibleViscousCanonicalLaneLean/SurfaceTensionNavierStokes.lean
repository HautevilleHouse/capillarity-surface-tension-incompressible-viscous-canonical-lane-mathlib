import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure SurfaceTensionNavierStokesPackage where
  velocityField : Type u
  pressureField : Type v
  surfaceTensionForce : Prop
  incompressibilityConstraint : Prop
  viscousStressTensor : Prop
  noslipBoundaryCondition : Prop
  surfaceTensionForceTerm : surfaceTensionForce
  incompressibilityConstraintTerm : incompressibilityConstraint
  viscousStressTensorTerm : viscousStressTensor
  noslipBoundaryConditionTerm : noslipBoundaryCondition

structure SurfaceTensionNavierStokesEvidence (F : SurfaceTensionNavierStokesPackage) where
  surfaceTensionForceClosed : F.surfaceTensionForce
  incompressibilityConstraintClosed : F.incompressibilityConstraint
  viscousStressTensorClosed : F.viscousStressTensor
  noslipBoundaryConditionClosed : F.noslipBoundaryCondition

def SurfaceTensionNavierStokesClosed (F : SurfaceTensionNavierStokesPackage) : Prop :=
  F.surfaceTensionForce ∧ F.incompressibilityConstraint ∧
  F.viscousStressTensor ∧ F.noslipBoundaryCondition

theorem surface_tension_navier_stokes_closed_from_evidence
    (F : SurfaceTensionNavierStokesPackage) (E : SurfaceTensionNavierStokesEvidence F) :
    SurfaceTensionNavierStokesClosed F := by
  exact And.intro E.surfaceTensionForceClosed
    (And.intro E.incompressibilityConstraintClosed
      (And.intro E.viscousStressTensorClosed E.noslipBoundaryConditionClosed))

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse