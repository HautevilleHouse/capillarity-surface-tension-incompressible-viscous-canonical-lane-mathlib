import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure DropDynamicsPackage where
  dropRadius : ℝ
  surfaceTension : ℝ
  viscosity : ℝ
  oscillationFrequency : ℝ
  rayleighPlessetEquationSatisfied : Prop
  dampingRateMatchesTheory : Prop
  shapeDeformationConstrained : Prop

structure DropDynamicsEvidence (D : DropDynamicsPackage) where
  rayleighPlessetEquationSatisfiedClosed : D.rayleighPlessetEquationSatisfied
  dampingRateMatchesTheoryClosed : D.dampingRateMatchesTheory
  shapeDeformationConstrainedClosed : D.shapeDeformationConstrained

def DropDynamicsClosed (D : DropDynamicsPackage) : Prop :=
  D.rayleighPlessetEquationSatisfied ∧ D.dampingRateMatchesTheory ∧ D.shapeDeformationConstrained

theorem drop_dynamics_closed_from_evidence
    (D : DropDynamicsPackage) (E : DropDynamicsEvidence D) :
    DropDynamicsClosed D := by
  exact And.intro E.rayleighPlessetEquationSatisfiedClosed
    (And.intro E.dampingRateMatchesTheoryClosed E.shapeDeformationConstrainedClosed)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse
